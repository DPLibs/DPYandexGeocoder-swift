//
//  DPYMService.swift
//  
//
//  Created by Дмитрий Поляков on 14.12.2022.
//

import Foundation
import DPLogger

open class DPYMService<Request: DPYMRequestFactory, Mapper: DPYMMapperFactory>: DPLoggable {
    
    // MARK: - Init
    public init(mapper: Mapper) {
        self.session = .shared
        self.mapper = mapper
    }
    
    // MARK: - Props
    public typealias Completion = (Result<Mapper.Model, Error>) -> Void
    open var session: URLSession
    open private(set) var task: URLSessionDataTask?
    open var mapper: Mapper
    
    public var isDPLoggingEnabled: Bool = true
    
    // MARK: - Methods
    open func load(_ request: Request, completion: @escaping Completion) {
        do {
            let urlRequest = try request.generateURLRequest()
            
            self.task?.cancel()
            self.task = self.session.dataTask(with: urlRequest, completionHandler: { [weak self] data, urlResponse, error in
                guard let self = self else { return }
                self.log(urlRequest: urlRequest, urlReponse: urlResponse, data: data, error: error)
                
                do {
                    if let data = data, let httpURLResponse = urlResponse as? HTTPURLResponse {
                        let statusCode = httpURLResponse.statusCode
                        let decoder = JSONDecoder()
                        
                        if statusCode == 200 || statusCode == 201 {
                            let response = try decoder.decode(Mapper.Response.self, from: data)
                            let model = try self.mapper.mapResponseToModel(response)
                            completion(.success(model))
                        } else {
                            if let errorResponse = try? decoder.decode(DPYMErrorResponse.self, from: data) {
                                let error = DPYMError(
                                    identifer: errorResponse.error,
                                    message: errorResponse.message
                                )
                                
                                throw error
                            } else {
                                throw DPYMError.unknown
                            }
                        }
                    } else {
                        throw error ?? DPYMError.unknown
                    }
                } catch {
                    guard (error as NSError).code != NSURLErrorCancelled else { return }
                    self.log(error: error)
                    completion(.failure(error))
                }
            })
            self.task?.resume()
        } catch {
            self.log(error: error)
            completion(.failure(error))
        }
    }
    
}

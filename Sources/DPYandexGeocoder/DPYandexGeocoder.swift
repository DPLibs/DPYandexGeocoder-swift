//
//  DPYandexGeocoder.swift
//  
//
//  Created by Дмитрий Поляков on 07.10.2022.
//

import Foundation
import DPLogger

open class DPYandexGeocoder: DPLoggable {
    
    // MARK: - Init
    public init() {
        self.session = .shared
    }
    
    // MARK: - Props
    public typealias Completion = (Result<DPYandexGeocoderSuccess, Error>) -> Void
    open var session: URLSession
    open private(set) var task: URLSessionDataTask?
    
    public var isDPLoggingEnabled: Bool = true
    
    // MARK: - Methods
    open func load(_ requestGenerator: DPYandexGeocoderRequestGenerator, completion: @escaping Completion) {
        do {
            let urlRequest = try requestGenerator.generateURLRequest()
            
            self.task?.cancel()
            self.task = self.session.dataTask(with: urlRequest, completionHandler: { [weak self] data, urlResponse, error in
                do {
                    let logger = DPLoggerDataTaskCompletionDebugString(title: .init(className: "DPYandexGeocoder", functionName: #function), urlRequest: urlRequest, urlReponse: urlResponse, data: data, error: error)
                    
                    self?.log(debugString: logger)
                    
                    if let data = data, let httpURLResponse = urlResponse as? HTTPURLResponse {
                        let statusCode = httpURLResponse.statusCode
                        let decoder = JSONDecoder()
                        
                        if statusCode == 200 || statusCode == 201 {
                            let response = try decoder.decode(DPYandexGeocoderSuccessResponse.self, from: data)
                            
                            let model = DPYandexGeocoderSuccessMapper().mapResponseToModel(
                                response,
                                sco: requestGenerator.sco ?? .default
                            )
                            
                            completion(.success(model))
                        } else {
                            if let errorResponse = try? decoder.decode(DPYandexGeocoderErrorResponse.self, from: data) {
                                let error = DPYandexGeocoderError(
                                    identifer: errorResponse.error,
                                    message: errorResponse.message
                                )
                                
                                throw error
                            } else {
                                throw DPYandexGeocoderError.unknown
                            }
                        }
                    } else {
                        throw error ?? DPYandexGeocoderError.unknown
                    }
                } catch {
                    guard (error as NSError).code != NSURLErrorCancelled else { return }
                    self?.log(error: error)
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

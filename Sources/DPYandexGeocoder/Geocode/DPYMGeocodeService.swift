//
//  DPYMGeocodeService.swift
//  
//
//  Created by Дмитрий Поляков on 07.10.2022.
//

import Foundation

open class DPYMGeocodeService: DPYMService<DPYMGeocodeRequest, DPYMGeocodeSuccessMapper> {}

//import DPLogger

//open class DPYandexGeocodeService: DPLoggable {
//
//    // MARK: - Init
//    public init() {
//        self.session = .shared
//    }
//
//    // MARK: - Props
//    public typealias Completion = (Result<DPYandexGeocodeSuccess, Error>) -> Void
//    open var session: URLSession
//    open private(set) var task: URLSessionDataTask?
//
//    public var isDPLoggingEnabled: Bool = true
//
//    // MARK: - Methods
//    open func load(_ request: DPYandexGeocodeRequest, completion: @escaping Completion) {
//        do {
//            let urlRequest = try request.generateURLRequest()
//
//            self.task?.cancel()
//            self.task = self.session.dataTask(with: urlRequest, completionHandler: { [weak self] data, urlResponse, error in
//                do {
//                    let logger = DPLoggerDataTaskCompletionDebugString(title: .init(className: "DPYandexGeocoder", functionName: #function), urlRequest: urlRequest, urlReponse: urlResponse, data: data, error: error)
//
//                    self?.log(debugString: logger)
//
//                    if let data = data, let httpURLResponse = urlResponse as? HTTPURLResponse {
//                        let statusCode = httpURLResponse.statusCode
//                        let decoder = JSONDecoder()
//
//                        if statusCode == 200 || statusCode == 201 {
//                            let response = try decoder.decode(DPYandexGeocodeSuccessResponse.self, from: data)
//                            let model = try DPYandexGeocodeSuccessMapper().mapResponseToModel(response)
//                            completion(.success(model))
//                        } else {
//                            if let errorResponse = try? decoder.decode(DPYMErrorResponse.self, from: data) {
//                                let error = DPYandexError(
//                                    identifer: errorResponse.error,
//                                    message: errorResponse.message
//                                )
//
//                                throw error
//                            } else {
//                                throw DPYandexError.unknown
//                            }
//                        }
//                    } else {
//                        throw error ?? DPYandexError.unknown
//                    }
//                } catch {
//                    guard (error as NSError).code != NSURLErrorCancelled else { return }
//                    self?.log(error: error)
//                    completion(.failure(error))
//                }
//            })
//            self.task?.resume()
//        } catch {
//            self.log(error: error)
//            completion(.failure(error))
//        }
//    }
//
//}

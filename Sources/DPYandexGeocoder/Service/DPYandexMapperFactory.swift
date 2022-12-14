//
//  DPYandexMapperFactory.swift
//  
//
//  Created by Дмитрий Поляков on 14.12.2022.
//

import Foundation

public protocol DPYandexMapperFactory {
    associatedtype Response: Decodable
    associatedtype Model
    
    func mapResponseToModel(_ response: Response) throws -> Model
}

//
//  DPYandexRequestGeneratorFactory.swift
//  
//
//  Created by Дмитрий Поляков on 14.12.2022.
//

import Foundation

public protocol DPYandexRequestFactory {
    func generateURLRequest() throws -> URLRequest
}

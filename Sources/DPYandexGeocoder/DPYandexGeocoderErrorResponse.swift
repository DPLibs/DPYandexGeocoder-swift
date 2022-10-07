//
//  DPYandexGeocoderErrorResponse.swift
//  
//
//  Created by Дмитрий Поляков on 07.10.2022.
//

import Foundation

public struct DPYandexGeocoderErrorResponse: Decodable {
    public let statusCode: Int
    public let error: String
    public let message: String
}

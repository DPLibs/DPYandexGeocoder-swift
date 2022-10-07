//
//  DPYandexGeocoderError.swift
//  
//
//  Created by Дмитрий Поляков on 07.10.2022.
//

import Foundation

public struct DPYandexGeocoderError {
    public let identifer: String
    public let message: String
}

// MARK: - Equatable
extension DPYandexGeocoderError: Equatable {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.identifer == rhs.identifer
    }
    
}

// MARK: - LocalizedError
extension DPYandexGeocoderError: LocalizedError {
    
    public var errorDescription: String? {
        self.message
    }
    
    public var failureReason: String? {
        self.message
    }
    
}

// MARK: - DPYandexGeocoderError
public extension DPYandexGeocoderError {
    
    static let unknown = DPYandexGeocoderError(
        identifer: "unknown",
        message: "Unknown error"
    )
    
    static let failedGenerateURLRequest = DPYandexGeocoderError(
        identifer: "badGenerateURLRequest",
        message: "Failed to generate URLRequest"
    )
    
    static let failedParse = DPYandexGeocoderError(
        identifer: "failedParse",
        message: "Failed parse"
    )

}

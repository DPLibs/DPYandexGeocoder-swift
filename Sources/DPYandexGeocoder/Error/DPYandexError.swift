//
//  DPYandexError.swift
//  
//
//  Created by Дмитрий Поляков on 07.10.2022.
//

import Foundation

public struct DPYandexError {
    public let identifer: String
    public let message: String
}

// MARK: - Equatable
extension DPYandexError: Equatable {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.identifer == rhs.identifer
    }
    
}

// MARK: - LocalizedError
extension DPYandexError: LocalizedError {
    
    public var errorDescription: String? {
        self.message
    }
    
    public var failureReason: String? {
        self.message
    }
    
}

// MARK: - DPYandexGeocoderError
public extension DPYandexError {
    
    static let unknown = DPYandexError(
        identifer: "unknown",
        message: "Unknown error"
    )
    
    static let failedGenerateURLRequest = DPYandexError(
        identifer: "badGenerateURLRequest",
        message: "Failed to generate URLRequest"
    )
    
    static let failedParse = DPYandexError(
        identifer: "failedParse",
        message: "Failed parse"
    )

}

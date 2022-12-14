//
//  DPYMError.swift
//  
//
//  Created by Дмитрий Поляков on 07.10.2022.
//

import Foundation

public struct DPYMError {
    public let identifer: String
    public let message: String
}

// MARK: - Equatable
extension DPYMError: Equatable {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.identifer == rhs.identifer
    }
    
}

// MARK: - LocalizedError
extension DPYMError: LocalizedError {
    
    public var errorDescription: String? {
        self.message
    }
    
    public var failureReason: String? {
        self.message
    }
    
}

// MARK: - DPYandexGeocoderError
public extension DPYMError {
    
    static let unknown = DPYMError(
        identifer: "unknown",
        message: "Unknown error"
    )
    
    static let failedGenerateURLRequest = DPYMError(
        identifer: "badGenerateURLRequest",
        message: "Failed to generate URLRequest"
    )
    
    static let failedParse = DPYMError(
        identifer: "failedParse",
        message: "Failed parse"
    )

}

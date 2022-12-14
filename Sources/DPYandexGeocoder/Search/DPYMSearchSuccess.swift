//
//  File.swift
//  
//
//  Created by Дмитрий Поляков on 14.12.2022.
//

import Foundation

public struct DPYMSearchSuccess {
    
    // MARK: - Init
    public init(objects: [Object]) {
        self.objects = objects
    }
    
    // MARK: - Props
    public let objects: [Object]
}

// MARK: - Object
public extension DPYMSearchSuccess {
    
    struct Object {
        
        // MARK: - Init
        public init(
            coordinates: DPYMCoordinates,
            name: String,
            descriptionText: String,
            company: Company?,
            geocoder: Geocoder?
        ) {
            self.coordinates = coordinates
            self.name = name
            self.descriptionText = descriptionText
            self.company = company
            self.geocoder = geocoder
        }
        
        // MARK: - Props
        public let coordinates: DPYMCoordinates
        public let name: String
        public let descriptionText: String
        public let company: Company?
        public let geocoder: Geocoder?
    }
    
}

// MARK: - Company
public extension DPYMSearchSuccess {
    
    struct Company {
        
        // MARK: - Init
        public init(
            id: String,
            name: String,
            address: String,
            urlString: String,
            phones: [CompanyPhone],
            categories: [CompanyCategory]
        ) {
            self.id = id
            self.name = name
            self.address = address
            self.urlString = urlString
            self.phones = phones
            self.categories = categories
        }
        
        // MARK: - Props
        public let id: String
        public let name: String
        public let address: String
        public let urlString: String
        public let phones: [CompanyPhone]
        public let categories: [CompanyCategory]
    }
    
}

// MARK: - CompanyPhone
public extension DPYMSearchSuccess {
    
    struct CompanyPhone {
        
        // MARK: - Init
        public init(
            type: String,
            formatted: String
        ) {
            self.type = type
            self.formatted = formatted
        }
        
        // MARK: - Props
        public let type: String
        public let formatted: String
    }
    
}

// MARK: - CompanyCategory
public extension DPYMSearchSuccess {
    
    struct CompanyCategory {
        
        // MARK: - Init
        public init(
            type: String,
            name: String
        ) {
            self.type = type
            self.name = name
        }
        
        // MARK: - Props
        public let type: String
        public let name: String
    }
    
}

// MARK: - Geocoder
public extension DPYMSearchSuccess {
    
    struct Geocoder {
        
        // MARK: - Init
        public init(
            kind: DPYMKind,
            text: String,
            precision: DPYMPrecision
        ) {
            self.kind = kind
            self.text = text
            self.precision = precision
        }
        
        // MARK: - Props
        public let kind: DPYMKind
        public let text: String
        public let precision: DPYMPrecision
    }
    
}

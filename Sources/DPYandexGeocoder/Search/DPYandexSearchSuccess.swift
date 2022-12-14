//
//  File.swift
//  
//
//  Created by Дмитрий Поляков on 14.12.2022.
//

import Foundation

public struct DPYandexSearchSuccess {
    
    // MARK: - Init
    public init(objects: [Object]) {
        self.objects = objects
    }
    
    // MARK: - Props
    public let objects: [Object]
}

// MARK: - Object
public extension DPYandexSearchSuccess {
    
    struct Object {
        
        // MARK: - Init
        public init(
            coordinates: DPYandexCoordinates,
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
        public let coordinates: DPYandexCoordinates
        public let name: String
        public let descriptionText: String
        public let company: Company?
        public let geocoder: Geocoder?
    }
    
}

// MARK: - Company
public extension DPYandexSearchSuccess {
    
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
public extension DPYandexSearchSuccess {
    
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
public extension DPYandexSearchSuccess {
    
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
public extension DPYandexSearchSuccess {
    
    struct Geocoder {
        
        // MARK: - Init
        public init(
            kind: DPYandexKind,
            text: String,
            precision: DPYandexPrecision
        ) {
            self.kind = kind
            self.text = text
            self.precision = precision
        }
        
        // MARK: - Props
        public let kind: DPYandexKind
        public let text: String
        public let precision: DPYandexPrecision
    }
    
}

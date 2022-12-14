//
//  DPYandexGeocodeSuccess.swift
//  
//
//  Created by Дмитрий Поляков on 07.10.2022.
//

import Foundation

public struct DPYandexGeocodeSuccess {
    
    // MARK: - Init
    public init(geoObjects: [GeoObject]) {
        self.geoObjects = geoObjects
    }
    
    // MARK: - Props
    public let geoObjects: [GeoObject]
}

// MARK: - GeoObject
public extension DPYandexGeocodeSuccess {
    
    struct GeoObject {
        
        // MARK: - Init
        public init(
            metaData: GeocoderMetaData,
            description: String,
            name: String,
            boundedBy: Envelope?,
            point: DPYandexCoordinates?
        ) {
            self.metaData = metaData
            self.description = description
            self.name = name
            self.boundedBy = boundedBy
            self.point = point
        }
        
        // MARK: - Props
        public let metaData: GeocoderMetaData
        public let description: String
        public let name: String
        public let boundedBy: Envelope?
        public let point: DPYandexCoordinates?
    }
    
}

// MARK: - Envelope
public extension DPYandexGeocodeSuccess {
    
    struct Envelope {
        
        // MARK: - Init
        public init(lowerCorner: DPYandexCoordinates, upperCorner: DPYandexCoordinates) {
            self.lowerCorner = lowerCorner
            self.upperCorner = upperCorner
        }
        
        // MARK: - Props
        public let lowerCorner: DPYandexCoordinates
        public let upperCorner: DPYandexCoordinates
    }
    
}

// MARK: - GeocoderMetaData
public extension DPYandexGeocodeSuccess {
    
    struct GeocoderMetaData {
        
        // MARK: - Init
        public init(
            kind: DPYandexKind,
            text: String,
            precision: DPYandexPrecision,
            address: Address
        ) {
            self.kind = kind
            self.text = text
            self.precision = precision
            self.address = address
        }
        
        // MARK: - Props
        public let kind: DPYandexKind
        public let text: String
        public let precision: DPYandexPrecision
        public let address: Address
    }
    
}

// MARK: - Address
public extension DPYandexGeocodeSuccess {
    
    struct Address {
        
        // MARK: - Init
        public init(
            countryCode: String,
            postalCode: String,
            formatted: String,
            components: [Component]
        ) {
            self.countryCode = countryCode
            self.postalCode = postalCode
            self.formatted = formatted
            self.components = components
        }
        
        // MARK: - Props
        public let countryCode: String
        public let postalCode: String
        public let formatted: String
        public let components: [Component]
    }
    
}

// MARK: - Component
public extension DPYandexGeocodeSuccess {
    
    struct Component {
        
        // MARK: - Init
        public init(kind: DPYandexKind, name: String) {
            self.kind = kind
            self.name = name
        }
        
        // MARK: - Props
        public let kind: DPYandexKind
        public let name: String
    }
    
}

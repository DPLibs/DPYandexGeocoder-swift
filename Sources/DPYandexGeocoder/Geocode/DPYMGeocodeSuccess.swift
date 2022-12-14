//
//  DPYMGeocodeSuccess.swift
//  
//
//  Created by Дмитрий Поляков on 07.10.2022.
//

import Foundation

public struct DPYMGeocodeSuccess {
    
    // MARK: - Init
    public init(geoObjects: [GeoObject]) {
        self.geoObjects = geoObjects
    }
    
    // MARK: - Props
    public let geoObjects: [GeoObject]
}

// MARK: - GeoObject
public extension DPYMGeocodeSuccess {
    
    struct GeoObject {
        
        // MARK: - Init
        public init(
            metaData: GeocoderMetaData,
            description: String,
            name: String,
            boundedBy: Envelope?,
            point: DPYMCoordinates?
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
        public let point: DPYMCoordinates?
    }
    
}

// MARK: - Envelope
public extension DPYMGeocodeSuccess {
    
    struct Envelope {
        
        // MARK: - Init
        public init(lowerCorner: DPYMCoordinates, upperCorner: DPYMCoordinates) {
            self.lowerCorner = lowerCorner
            self.upperCorner = upperCorner
        }
        
        // MARK: - Props
        public let lowerCorner: DPYMCoordinates
        public let upperCorner: DPYMCoordinates
    }
    
}

// MARK: - GeocoderMetaData
public extension DPYMGeocodeSuccess {
    
    struct GeocoderMetaData {
        
        // MARK: - Init
        public init(
            kind: DPYMKind,
            text: String,
            precision: DPYMPrecision,
            address: Address
        ) {
            self.kind = kind
            self.text = text
            self.precision = precision
            self.address = address
        }
        
        // MARK: - Props
        public let kind: DPYMKind
        public let text: String
        public let precision: DPYMPrecision
        public let address: Address
    }
    
}

// MARK: - Address
public extension DPYMGeocodeSuccess {
    
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
public extension DPYMGeocodeSuccess {
    
    struct Component {
        
        // MARK: - Init
        public init(kind: DPYMKind, name: String) {
            self.kind = kind
            self.name = name
        }
        
        // MARK: - Props
        public let kind: DPYMKind
        public let name: String
    }
    
}

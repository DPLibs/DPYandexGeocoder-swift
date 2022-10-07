//
//  DPYandexGeocoderSuccess.swift
//  
//
//  Created by Дмитрий Поляков on 07.10.2022.
//

import Foundation

public struct DPYandexGeocoderSuccess {
    
    // MARK: - Init
    public init(geoObjects: [GeoObject]) {
        self.geoObjects = geoObjects
    }
    
    // MARK: - Props
    public let geoObjects: [GeoObject]
}

// MARK: - GeoObject
public extension DPYandexGeocoderSuccess {
    
    struct GeoObject {
        
        // MARK: - Init
        public init(
            metaData: GeocoderMetaData,
            description: String,
            name: String,
            boundedBy: Envelope?,
            point: Position?
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
        public let point: Position?
    }
    
}

// MARK: - Envelope
public extension DPYandexGeocoderSuccess {
    
    struct Envelope {
        
        // MARK: - Init
        public init(lowerCorner: Position, upperCorner: Position) {
            self.lowerCorner = lowerCorner
            self.upperCorner = upperCorner
        }
        
        // MARK: - Props
        public let lowerCorner: Position
        public let upperCorner: Position
    }
    
}

// MARK: - GeocoderMetaData
public extension DPYandexGeocoderSuccess {
    
    struct GeocoderMetaData {
        
        // MARK: - Init
        public init(
            kind: Kind,
            text: String,
            precision: Precision,
            address: Address
        ) {
            self.kind = kind
            self.text = text
            self.precision = precision
            self.address = address
        }
        
        // MARK: - Props
        public let kind: Kind
        public let text: String
        public let precision: Precision
        public let address: Address
    }
    
}

// MARK: - Address
public extension DPYandexGeocoderSuccess {
    
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
public extension DPYandexGeocoderSuccess {
    
    struct Component {
        
        // MARK: - Init
        public init(kind: Kind, name: String) {
            self.kind = kind
            self.name = name
        }
        
        // MARK: - Props
        public let kind: Kind
        public let name: String
    }
    
}

// MARK: - Component
public extension DPYandexGeocoderSuccess {
    
    enum Kind: String {
        
        /// отдельный дом
        case house = "house"

        /// улица
        case street = "street"

        /// станция метро
        case metro = "metro"

        /// район города
        case district = "district"

        /// населённый пункт: город / поселок / деревня / село и т. п.
        case locality = "locality"

        /// район области
        case area = "area"

        /// область
        case province = "province"

        /// страна
        case country = "country"

        /// река / озеро / ручей / водохранилище и т.п.
        case hydro = "hydro"

        /// ж.д. станция
        case railway = "railway"
        
        /// линия метро / шоссе / ж.д. линия
        case route = "route"
        
        /// лес / парк / сад и т. п.
        case vegetation = "vegetation"

        /// аэропорт
        case airport = "airport"

        /// прочее
        case other = "other"
        
        public static let `default`: Kind = .other
    }
    
}

// MARK: - Position
public extension DPYandexGeocoderSuccess {
    
    struct Position {
        
        // MARK: - Init
        public init(lat: Double, lng: Double) {
            self.lat = lat
            self.lng = lng
        }
        
        public init?(stringValue: String?) {
            guard let stringValue = stringValue else { return nil }
            let components = stringValue.split(separator: " ")
            
            guard
                let first = components.first,
                let last = components.last,
                let firstDouble = Double(first),
                let lastDouble = Double(last)
            else { return nil }
            
            self.lat = firstDouble
            self.lng = lastDouble
        }
        
        // MARK: - Props
        public let lat: Double
        public let lng: Double
    }
    
}

// MARK: - Precision
public extension DPYandexGeocoderSuccess {
    
    enum Precision: String {
        
        /// Найден дом с указанным номером дома.
        case exact = "exact"
        
        /// Найден дом с указанным номером, но с другим номером строения или корпуса.
        case number = "number"
        
        /// Найден дом с номером, близким к запрошенному.
        case near = "near"
        
        /// Найдены приблизительные координаты запрашиваемого дома.
        case range = "range"
        
        /// Найдена только улица.
        case street = "street"
        
        /// Не найдена улица, но найден, например, посёлок, район и т. п.
        case other = "other"
        
        public static let `default`: Precision = .other
    }
    
}

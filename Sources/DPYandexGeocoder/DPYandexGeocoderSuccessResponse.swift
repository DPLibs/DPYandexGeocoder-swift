//
//  DPYandexGeocoderSuccessResponse.swift
//  
//
//  Created by Дмитрий Поляков on 07.10.2022.
//

import Foundation

public struct DPYandexGeocoderSuccessResponse: Decodable {
    
    // MARK: - Props
    public let response: Response?
    
    // MARK: - Codable
    enum CodingKeys: String, CodingKey {
        case response = "response"
    }
    
}

// MARK: - Response
public extension DPYandexGeocoderSuccessResponse {
    
    struct Response: Decodable {
        
        // MARK: - Props
        public let geoObjectCollection: GeoObjectCollectionResponse?
        
        // MARK: - Codable
        enum CodingKeys: String, CodingKey {
            case geoObjectCollection = "GeoObjectCollection"
        }
    }
    
}

// MARK: - GeoObjectCollectionResponse
public extension DPYandexGeocoderSuccessResponse {
    
    struct GeoObjectCollectionResponse: Decodable {
        
        // MARK: - Props
        public let metaDataProperty: MetaDataPropertyResponse?
        public let featureMember: [FeatureMemberResponse?]?
        
        // MARK: - Codable
        enum CodingKeys: String, CodingKey {
            case metaDataProperty = "metaDataProperty"
            case featureMember = "featureMember"
        }
    }
    
}

// MARK: - MetaDataPropertyResponse
public extension DPYandexGeocoderSuccessResponse {
    
    struct MetaDataPropertyResponse: Decodable {
        
        // MARK: - Props
        public let geocoderResponseMetaData: GeocoderResponseMetaDataResponse?
        
        // MARK: - Codable
        enum CodingKeys: String, CodingKey {
            case geocoderResponseMetaData = "GeocoderResponseMetaData"
        }
    }
    
}

// MARK: - GeocoderResponseMetaDataResponse
public extension DPYandexGeocoderSuccessResponse {
    
    struct GeocoderResponseMetaDataResponse: Decodable {
        
        // MARK: - Props
        public let request: String?
        public let found: String?
        public let results: String?
        
        // MARK: - Decodable
        enum CodingKeys: String, CodingKey {
            case request = "request"
            case found = "found"
            case results = "results"
        }
    }
    
}

// MARK: - FeatureMemberResponse
public extension DPYandexGeocoderSuccessResponse {
    
    struct FeatureMemberResponse: Decodable {
        
        // MARK: - Props
        public let geoObject: GeoObjectResponse?
        
        // MARK: - Decodable
        enum CodingKeys: String, CodingKey {
            case geoObject = "GeoObject"
        }
    }
    
}

// MARK: - GeoObjectResponse
public extension DPYandexGeocoderSuccessResponse {
    
    struct GeoObjectResponse: Decodable {
        
        // MARK: - Props
        public let metaDataProperty: GeoObjectMetaDataPropertyResponse?
        public let description: String?
        public let name: String?
        public let boundedBy: BoundedByResponse?
        public let point: PointResponse?
        
        // MARK: - Decodable
        enum CodingKeys: String, CodingKey {
            case metaDataProperty = "metaDataProperty"
            case description = "description"
            case name = "name"
            case boundedBy = "boundedBy"
            case point = "Point"
        }
    }
    
}

// MARK: - GeoObjectMetaDataPropertyResponse
public extension DPYandexGeocoderSuccessResponse {
    
    struct GeoObjectMetaDataPropertyResponse: Decodable {
        
        // MARK: - Props
        public let geocoderMetaData: GeocoderMetaDataResponse?
        
        // MARK: - Decodable
        enum CodingKeys: String, CodingKey {
            case geocoderMetaData = "GeocoderMetaData"
        }
    }
    
}

// MARK: - PointResponse
public extension DPYandexGeocoderSuccessResponse {
    
    struct PointResponse: Decodable {
        
        // MARK: - Props
        public let pos: String?
        
        // MARK: - Decodable
        enum CodingKeys: String, CodingKey {
            case pos = "pos"
        }
    }
    
}

// MARK: - BoundedByResponse
public extension DPYandexGeocoderSuccessResponse {
    
    struct BoundedByResponse: Decodable {
        
        // MARK: - Init
        public let envelope: EnvelopeResponse?
        
        // MARK: - Decodable
        enum CodingKeys: String, CodingKey {
            case envelope = "Envelope"
        }
    }
    
}

// MARK: - EnvelopeResponse
public extension DPYandexGeocoderSuccessResponse {
    
    struct EnvelopeResponse: Decodable {
        
        // MARK: - Props
        public let lowerCorner: String?
        public let upperCorner: String?
        
        // MARK: - Decodable
        enum CodingKeys: String, CodingKey {
            case lowerCorner = "lowerCorner"
            case upperCorner = "upperCorner"
        }
    }
    
}

// MARK: - GeocoderMetaDataResponse
public extension DPYandexGeocoderSuccessResponse {
    
    struct GeocoderMetaDataResponse: Decodable {
        
        // MARK: - Props
        public let kind: String?
        public let text: String?
        public let precision: String?
        public let address: AddressResponse?
        
        // MARK: - Decodable
        enum CodingKeys: String, CodingKey {
            case kind = "kind"
            case text = "text"
            case precision = "precision"
            case address = "Address"
        }
    }
    
}

// MARK: - AddressResponse
public extension DPYandexGeocoderSuccessResponse {
    
    struct AddressResponse: Decodable {
        
        // MARK: - Props
        public let countryCode: String?
        public let postalCode: String?
        public let formatted: String?
        public let components: [ComponentResponse?]?
        
        // MARK: - Decodable
        enum CodingKeys: String, CodingKey {
            case countryCode = "country_code"
            case postalCode = "postal_code"
            case formatted = "formatted"
            case components = "Components"
        }
    }
    
}

// MARK: - ComponentResponse
public extension DPYandexGeocoderSuccessResponse {
    
    struct ComponentResponse: Decodable {
        
        // MARK: - Props
        public let kind: String?
        public let name: String?
        
        // MARK: - Decodable
        enum CodingKeys: String, CodingKey {
            case kind = "kind"
            case name = "name"
        }
    }
    
}

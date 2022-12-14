//
//  DPYMSearchSuccessResponse.swift
//  
//
//  Created by Дмитрий Поляков on 14.12.2022.
//

import Foundation

public struct DPYMSearchSuccessResponse: Decodable {
    
    // MARK: - Props
    public let type: String?
    public let properties: PropertiesResponse?
    public let features: [FeatureResponse?]?
    
    // MARK: - Decodable
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case properties = "properties"
        case features = "features"
    }
}

// MARK: - PropertiesResponse
public extension DPYMSearchSuccessResponse {
    
    struct PropertiesResponse: Decodable {
        
        // MARK: - Props
        public let responseMetaData: PropertiesResponseMetaDataResponse?
        
        // MARK: - Decodable
        enum CodingKeys: String, CodingKey {
            case responseMetaData = "ResponseMetaData"
        }
    }
    
}

// MARK: - PropertiesResponseMetaDataResponse
public extension DPYMSearchSuccessResponse {
    
    struct PropertiesResponseMetaDataResponse: Decodable {
        
        // MARK: - Props
        public let searchResponse: PropertiesResponseMetaDataSearchResponse?
        public let searchRequest: PropertiesResponseMetaDataSearchRequestResponse?
        
        // MARK: - Decodable
        enum CodingKeys: String, CodingKey {
            case searchResponse = "SearchResponse"
            case searchRequest = "SearchRequest"
        }
    }
    
}

// MARK: - PropertiesResponseMetaDataSearchResponse
public extension DPYMSearchSuccessResponse {
    
    struct PropertiesResponseMetaDataSearchResponse: Decodable {
        
        // MARK: - Props
        public let found: Int?
        public let display: String?
        
        // MARK: - Decodable
        enum CodingKeys: String, CodingKey {
            case found = "found"
            case display = "display"
        }
    }
    
}

// MARK: - PropertiesResponseMetaDataSearchRequestResponse
public extension DPYMSearchSuccessResponse {
    
    struct PropertiesResponseMetaDataSearchRequestResponse: Decodable {
        
        // MARK: - Props
        public let request: String?
        public let skip: Int?
        public let results: Int?
        public let boundedBy: BoundedByResponse?
        
        // MARK: - Decodable
        enum CodingKeys: String, CodingKey {
            case request = "request"
            case skip = "skip"
            case results = "results"
            case boundedBy = "boundedBy"
        }
    }
    
}

// MARK: - BoundedByResponse
public extension DPYMSearchSuccessResponse {
    typealias BoundedByResponse = [PositionResponse?]
}

// MARK: - PositionResponse
public extension DPYMSearchSuccessResponse {
    typealias PositionResponse = [Double?]
}

// MARK: - FeatureResponse
public extension DPYMSearchSuccessResponse {
    
    struct FeatureResponse: Decodable {
        
        // MARK: - Props
        public let type: String?
        public let geometry: FeatureGeometryResponse?
        public let properties: FeaturePropertiesResponse?
        
        // MARK: - Decodable
        enum CodingKeys: String, CodingKey {
            case type = "type"
            case geometry = "geometry"
            case properties = "properties"
        }
    }
    
}

// MARK: - FeatureGeometryResponse
public extension DPYMSearchSuccessResponse {
    
    struct FeatureGeometryResponse: Decodable {
        
        // MARK: - Props
        public let type: String?
        public let coordinates: PositionResponse?
        
        // MARK: - Decodable
        enum CodingKeys: String, CodingKey {
            case type = "type"
            case coordinates = "coordinates"
        }
    }
    
}

// MARK: - FeaturePropertiesResponse
public extension DPYMSearchSuccessResponse {
    
    struct FeaturePropertiesResponse: Decodable {
        
        // MARK: - Props
        public let name: String?
        public let descriptionText: String?
        public let boundedBy: BoundedByResponse?
        public let companyMetaData: CompanyMetaDataResponse?
        public let geocoderMetaData: GeocoderMetaDataResponse?
        
        // MARK: - Decodable
        enum CodingKeys: String, CodingKey {
            case name = "name"
            case descriptionText = "description"
            case boundedBy = "boundedBy"
            case companyMetaData = "CompanyMetaData"
            case geocoderMetaData = "GeocoderMetaData"
        }
    }
    
}

// MARK: - CompanyMetaDataResponse
public extension DPYMSearchSuccessResponse {
    
    struct CompanyMetaDataResponse: Decodable {
        
        // MARK: - Props
        public let id: String?
        public let name: String?
        public let address: String?
        public let url: String?
        public let phones: [PhoneResponse?]?
        public let categories: [CategoryResponse?]?
        public let hours: HoursResponse?
        
        // MARK: - Decodable
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
            case address = "address"
            case url = "url"
            case phones = "Phones"
            case categories = "Categories"
            case hours = "Hours"
        }
    }
    
}

// MARK: - PhoneResponse
public extension DPYMSearchSuccessResponse {
    
    struct PhoneResponse: Decodable {
        
        // MARK: - Props
        public let type: String?
        public let formatted: String?
        
        // MARK: - Decodable
        enum CodingKeys: String, CodingKey {
            case type = "type"
            case formatted = "formatted"
        }
    }
    
}

// MARK: - CategoryResponse
public extension DPYMSearchSuccessResponse {
    
    struct CategoryResponse: Decodable {
        
        // MARK: - Props
        public let type: String?
        public let name: String?
        
        // MARK: - Decodable
        enum CodingKeys: String, CodingKey {
            case type = "class"
            case name = "name"
        }
    }
    
}

// MARK: - HoursResponse
public extension DPYMSearchSuccessResponse {
    
    struct HoursResponse: Decodable {
        
        // MARK: - Props
        public let text: String?
        public let availabilities: [HoursAvailabilityResponse?]?
        
        // MARK: - Decodable
        enum CodingKeys: String, CodingKey {
            case text = "text"
            case availabilities = "Availabilities"
        }
    }
    
}

// MARK: - HoursAvailabilityResponse
public extension DPYMSearchSuccessResponse {
    
    struct HoursAvailabilityResponse: Decodable {
        
        // MARK: - Props
        public let monday: Bool?
        public let tuesday: Bool?
        public let wednesday: Bool?
        public let thursday: Bool?
        public let friday: Bool?
        public let everyday: Bool?
        public let twentyFourHours: Bool?
        public let sunday: Bool?
        public let saturday: Bool?
        public let intervals: [HoursAvailabilityIntervalResponse?]?
        
        // MARK: - Decodable
        enum CodingKeys: String, CodingKey {
            case monday = "Monday"
            case tuesday = "Tuesday"
            case wednesday = "Wednesday"
            case thursday = "Thursday"
            case friday = "Friday"
            case everyday = "Everyday"
            case twentyFourHours = "TwentyFourHours"
            case sunday = "Sunday"
            case saturday = "Saturday"
            case intervals = "Intervals"
        }
    }
    
}

// MARK: - HoursAvailabilityIntervalResponse
public extension DPYMSearchSuccessResponse {
    
    struct HoursAvailabilityIntervalResponse: Decodable {
        
        // MARK: - Props
        public let from: String?
        public let to: String?
        
        // MARK: - Decodable
        enum CodingKeys: String, CodingKey {
            case from = "from"
            case to = "to"
        }
    }
    
}


// MARK: - GeocoderMetaDataResponse
public extension DPYMSearchSuccessResponse {
    
    struct GeocoderMetaDataResponse: Decodable {
        
        // MARK: - Props
        public let kind: String?
        public let text: String?
        public let precision: String?
        
        // MARK: - Decodable
        enum CodingKeys: String, CodingKey {
            case kind = "kind"
            case text = "text"
            case precision = "precision"
        }
    }
    
}

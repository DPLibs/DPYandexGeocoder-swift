//
//  DPYMSearchSuccessMapper.swift
//  
//
//  Created by Дмитрий Поляков on 14.12.2022.
//

import Foundation

public struct DPYMSearchSuccessMapper: DPYMMapperFactory {
    
    // MARK: - DPYandexMapperFactory
    public func mapResponseToModel(_ response: DPYMSearchSuccessResponse) throws -> DPYMSearchSuccess {
        let objects: [DPYMSearchSuccess.Object] = (response.features ?? []).compactMap({ featureResponse in
            guard
                let coordinates = self.mapToCoordinates(array: featureResponse?.geometry?.coordinates),
                let propertiesResponse = featureResponse?.properties
            else { return nil }
            
            return DPYMSearchSuccess.Object(
                coordinates: coordinates,
                name: propertiesResponse.name ?? "",
                descriptionText: propertiesResponse.descriptionText ?? "",
                company: self.mapToCompany(response: propertiesResponse.companyMetaData),
                geocoder: self.mapToGeocoder(response: propertiesResponse.geocoderMetaData)
            )
        })
        
        return DPYMSearchSuccess(objects: objects)
    }
    
    // MARK: - Methods
    func mapToCoordinates(array: [Double?]?) -> DPYMCoordinates? {
        guard
            let array = array,
            array.count >= 2,
            let first = array[0],
            let second = array[1]
        else { return nil }
        
        return DPYMCoordinates(longitude: first, latitude: second)
    }
    
    func mapToCompany(response: DPYMSearchSuccessResponse.CompanyMetaDataResponse?) -> DPYMSearchSuccess.Company? {
        guard
            let id = response?.id,
            let name = response?.name
        else { return nil }
        
        let phones: [DPYMSearchSuccess.CompanyPhone] = (response?.phones ?? []).compactMap { phoneResponse in
            guard let formatted = phoneResponse?.formatted else { return nil }
            
            return DPYMSearchSuccess.CompanyPhone(
                type: phoneResponse?.type ?? "",
                formatted: formatted
            )
        }
        
        let categories: [DPYMSearchSuccess.CompanyCategory] = (response?.categories ?? []).compactMap { categoryResponse in
            guard let name = categoryResponse?.name else { return nil }
            
            return DPYMSearchSuccess.CompanyCategory(
                type: categoryResponse?.type ?? "",
                name: name
            )
        }
        
        return DPYMSearchSuccess.Company(
            id: id,
            name: name,
            address: response?.address ?? "",
            urlString: response?.url ?? "",
            phones: phones,
            categories: categories
        )
    }
    
    func mapToGeocoder(response: DPYMSearchSuccessResponse.GeocoderMetaDataResponse?) -> DPYMSearchSuccess.Geocoder? {
        DPYMSearchSuccess.Geocoder(
            kind: DPYMKind(rawValue: response?.precision ?? "") ?? .other,
            text: response?.text ?? "",
            precision: DPYMPrecision(rawValue: response?.precision ?? "") ?? .other
        )
    }
    
}

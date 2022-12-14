//
//  DPYandexSearchSuccessMapper.swift
//  
//
//  Created by Дмитрий Поляков on 14.12.2022.
//

import Foundation

public struct DPYandexSearchSuccessMapper: DPYandexMapperFactory {
    
    // MARK: - DPYandexMapperFactory
    public func mapResponseToModel(_ response: DPYandexSearchSuccessResponse) throws -> DPYandexSearchSuccess {
        let objects: [DPYandexSearchSuccess.Object] = (response.features ?? []).compactMap({ featureResponse in
            guard
                let coordinates = self.mapToCoordinates(array: featureResponse?.geometry?.coordinates),
                let propertiesResponse = featureResponse?.properties
            else { return nil }
            
            return DPYandexSearchSuccess.Object(
                coordinates: coordinates,
                name: propertiesResponse.name ?? "",
                descriptionText: propertiesResponse.descriptionText ?? "",
                company: self.mapToCompany(response: propertiesResponse.companyMetaData),
                geocoder: self.mapToGeocoder(response: propertiesResponse.geocoderMetaData)
            )
        })
        
        return DPYandexSearchSuccess(objects: objects)
    }
    
    // MARK: - Methods
    func mapToCoordinates(array: [Double?]?) -> DPYandexCoordinates? {
        guard
            let array = array,
            array.count >= 2,
            let first = array[0],
            let second = array[1]
        else { return nil }
        
        return DPYandexCoordinates(longitude: first, latitude: second)
    }
    
    func mapToCompany(response: DPYandexSearchSuccessResponse.CompanyMetaDataResponse?) -> DPYandexSearchSuccess.Company? {
        guard
            let id = response?.id,
            let name = response?.name
        else { return nil }
        
        let phones: [DPYandexSearchSuccess.CompanyPhone] = (response?.phones ?? []).compactMap { phoneResponse in
            guard let formatted = phoneResponse?.formatted else { return nil }
            
            return DPYandexSearchSuccess.CompanyPhone(
                type: phoneResponse?.type ?? "",
                formatted: formatted
            )
        }
        
        let categories: [DPYandexSearchSuccess.CompanyCategory] = (response?.categories ?? []).compactMap { categoryResponse in
            guard let name = categoryResponse?.name else { return nil }
            
            return DPYandexSearchSuccess.CompanyCategory(
                type: categoryResponse?.type ?? "",
                name: name
            )
        }
        
        return DPYandexSearchSuccess.Company(
            id: id,
            name: name,
            address: response?.address ?? "",
            urlString: response?.url ?? "",
            phones: phones,
            categories: categories
        )
    }
    
    func mapToGeocoder(response: DPYandexSearchSuccessResponse.GeocoderMetaDataResponse?) -> DPYandexSearchSuccess.Geocoder? {
        DPYandexSearchSuccess.Geocoder(
            kind: DPYandexKind(rawValue: response?.precision ?? "") ?? .other,
            text: response?.text ?? "",
            precision: DPYandexPrecision(rawValue: response?.precision ?? "") ?? .other
        )
    }
    
}

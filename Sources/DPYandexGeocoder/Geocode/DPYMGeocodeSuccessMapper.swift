//
//  DPYMGeocodeSuccessMapper.swift
//  
//
//  Created by Дмитрий Поляков on 07.10.2022.
//

import Foundation

public struct DPYMGeocodeSuccessMapper: DPYMMapperFactory {
    
    // MARK: - DPYandexMapperFactory
    public func mapResponseToModel(_ response: DPYMGeocodeSuccessResponse) throws -> DPYMGeocodeSuccess {
        let featureMemberResponses = response.response?.geoObjectCollection?.featureMember ?? []
        
        let geoObjects: [DPYMGeocodeSuccess.GeoObject] = featureMemberResponses.compactMap { memberResponse in
            guard let geoObjectReponse = memberResponse?.geoObject else { return nil }
            let metaDataResponse = geoObjectReponse.metaDataProperty?.geocoderMetaData
            let addressResponse = metaDataResponse?.address
            let envelopeResponse = geoObjectReponse.boundedBy?.envelope
            
            let address = DPYMGeocodeSuccess.Address(
                countryCode: addressResponse?.countryCode ?? "",
                postalCode: addressResponse?.postalCode ?? "",
                formatted: addressResponse?.formatted ?? "",
                components: (addressResponse?.components ?? []).compactMap({ componentResponse in
                    guard
                        let kindRawValue = componentResponse?.kind,
                        let name = componentResponse?.name
                    else { return nil }
                    
                    let kind = DPYMKind(rawValue: kindRawValue) ?? .other
                    
                    return DPYMGeocodeSuccess.Component(
                        kind: kind,
                        name: name
                    )
                })
            )
            
            let precision = DPYMPrecision(rawValue: metaDataResponse?.precision ?? "") ?? .other
            
            let boundedBy: DPYMGeocodeSuccess.Envelope? = {
                guard
                    let lowerCorner = self.mapToCoordinates(longlat: envelopeResponse?.lowerCorner),
                    let upperCorner = self.mapToCoordinates(longlat: envelopeResponse?.upperCorner)
                else { return nil }
                
                return DPYMGeocodeSuccess.Envelope(
                    lowerCorner: lowerCorner,
                    upperCorner: upperCorner
                )
            }()
            
            let point = self.mapToCoordinates(longlat: geoObjectReponse.point?.pos)
            let kind = DPYMKind(rawValue: metaDataResponse?.kind ?? "") ?? .other
             
            let metaData = DPYMGeocodeSuccess.GeocoderMetaData(
                kind: kind,
                text: metaDataResponse?.text ?? "",
                precision: precision,
                address: address
            )
            
            return DPYMGeocodeSuccess.GeoObject(
                metaData: metaData,
                description: geoObjectReponse.description ?? "",
                name: geoObjectReponse.name ?? "",
                boundedBy: boundedBy,
                point: point
            )
        }
        
        return DPYMGeocodeSuccess(geoObjects: geoObjects)
    }
    
    // MARK: - Methods
    func mapToCoordinates(longlat stringValue: String?) -> DPYMCoordinates? {
        guard let stringValue = stringValue else { return nil }
        let components = stringValue.split(separator: " ")
        
        guard
            let first = components.first,
            let last = components.last,
            let firstDouble = Double(first),
            let lastDouble = Double(last)
        else { return nil }
        
        return DPYMCoordinates(longitude: firstDouble, latitude: lastDouble)
    }
    
}

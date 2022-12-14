//
//  DPYandexGeocodeSuccessMapper.swift
//  
//
//  Created by Дмитрий Поляков on 07.10.2022.
//

import Foundation

public struct DPYandexGeocodeSuccessMapper: DPYandexMapperFactory {
    
    // MARK: - DPYandexMapperFactory
    public func mapResponseToModel(_ response: DPYandexGeocodeSuccessResponse) throws -> DPYandexGeocodeSuccess {
        let featureMemberResponses = response.response?.geoObjectCollection?.featureMember ?? []
        
        let geoObjects: [DPYandexGeocodeSuccess.GeoObject] = featureMemberResponses.compactMap { memberResponse in
            guard let geoObjectReponse = memberResponse?.geoObject else { return nil }
            let metaDataResponse = geoObjectReponse.metaDataProperty?.geocoderMetaData
            let addressResponse = metaDataResponse?.address
            let envelopeResponse = geoObjectReponse.boundedBy?.envelope
            
            let address = DPYandexGeocodeSuccess.Address(
                countryCode: addressResponse?.countryCode ?? "",
                postalCode: addressResponse?.postalCode ?? "",
                formatted: addressResponse?.formatted ?? "",
                components: (addressResponse?.components ?? []).compactMap({ componentResponse in
                    guard
                        let kindRawValue = componentResponse?.kind,
                        let name = componentResponse?.name
                    else { return nil }
                    
                    let kind = DPYandexKind(rawValue: kindRawValue) ?? .other
                    
                    return DPYandexGeocodeSuccess.Component(
                        kind: kind,
                        name: name
                    )
                })
            )
            
            let precision = DPYandexPrecision(rawValue: metaDataResponse?.precision ?? "") ?? .other
            
            let boundedBy: DPYandexGeocodeSuccess.Envelope? = {
                guard
                    let lowerCorner = self.mapToCoordinates(longlat: envelopeResponse?.lowerCorner),
                    let upperCorner = self.mapToCoordinates(longlat: envelopeResponse?.upperCorner)
                else { return nil }
                
                return DPYandexGeocodeSuccess.Envelope(
                    lowerCorner: lowerCorner,
                    upperCorner: upperCorner
                )
            }()
            
            let point = self.mapToCoordinates(longlat: geoObjectReponse.point?.pos)
            let kind = DPYandexKind(rawValue: metaDataResponse?.kind ?? "") ?? .other
             
            let metaData = DPYandexGeocodeSuccess.GeocoderMetaData(
                kind: kind,
                text: metaDataResponse?.text ?? "",
                precision: precision,
                address: address
            )
            
            return DPYandexGeocodeSuccess.GeoObject(
                metaData: metaData,
                description: geoObjectReponse.description ?? "",
                name: geoObjectReponse.name ?? "",
                boundedBy: boundedBy,
                point: point
            )
        }
        
        return DPYandexGeocodeSuccess(geoObjects: geoObjects)
    }
    
    // MARK: - Methods
    func mapToCoordinates(longlat stringValue: String?) -> DPYandexCoordinates? {
        guard let stringValue = stringValue else { return nil }
        let components = stringValue.split(separator: " ")
        
        guard
            let first = components.first,
            let last = components.last,
            let firstDouble = Double(first),
            let lastDouble = Double(last)
        else { return nil }
        
        return DPYandexCoordinates(longitude: firstDouble, latitude: lastDouble)
    }
    
}

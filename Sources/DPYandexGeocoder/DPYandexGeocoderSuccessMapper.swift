//
//  DPYandexGeocoderSuccessMapper.swift
//  
//
//  Created by Дмитрий Поляков on 07.10.2022.
//

import Foundation

public struct DPYandexGeocoderSuccessMapper {
    
    public func mapResponseToModel(
        _ response: DPYandexGeocoderSuccessResponse,
        sco: DPYandexGeocoderSCO
    ) -> DPYandexGeocoderSuccess {
        let featureMemberResponses = response.response?.geoObjectCollection?.featureMember ?? []
        
        let geoObjects: [DPYandexGeocoderSuccess.GeoObject] = featureMemberResponses.compactMap { memberResponse in
            guard let geoObjectReponse = memberResponse?.geoObject else { return nil }
            let metaDataResponse = geoObjectReponse.metaDataProperty?.geocoderMetaData
            let addressResponse = metaDataResponse?.address
            let envelopeResponse = geoObjectReponse.boundedBy?.envelope
            
            let address = DPYandexGeocoderSuccess.Address(
                countryCode: addressResponse?.countryCode ?? "",
                postalCode: addressResponse?.postalCode ?? "",
                formatted: addressResponse?.formatted ?? "",
                components: (addressResponse?.components ?? []).compactMap({ componentResponse in
                    guard
                        let kindRawValue = componentResponse?.kind,
                        let name = componentResponse?.name
                    else { return nil }
                    
                    let kind = DPYandexGeocoderSuccess.Kind(rawValue: kindRawValue) ?? .default
                    
                    return DPYandexGeocoderSuccess.Component(
                        kind: kind,
                        name: name
                    )
                })
            )
            
            let precision = DPYandexGeocoderSuccess.Precision(rawValue: metaDataResponse?.precision ?? "") ?? .default
            
            let boundedBy: DPYandexGeocoderSuccess.Envelope? = {
                guard
                    let lowerCorner = DPYandexGeocoderSuccess.Position(stringValue: envelopeResponse?.lowerCorner),
                    let upperCorner = DPYandexGeocoderSuccess.Position(stringValue: envelopeResponse?.upperCorner)
                else { return nil }
                
                return DPYandexGeocoderSuccess.Envelope(
                    lowerCorner: lowerCorner,
                    upperCorner: upperCorner
                )
            }()
            
            let point = DPYandexGeocoderSuccess.Position(stringValue: geoObjectReponse.point?.pos)
            let kind = DPYandexGeocoderSuccess.Kind(rawValue: metaDataResponse?.kind ?? "") ?? .default
             
            let metaData = DPYandexGeocoderSuccess.GeocoderMetaData(
                kind: kind,
                text: metaDataResponse?.text ?? "",
                precision: precision,
                address: address
            )
            
            return DPYandexGeocoderSuccess.GeoObject(
                metaData: metaData,
                description: geoObjectReponse.description ?? "",
                name: geoObjectReponse.name ?? "",
                boundedBy: boundedBy,
                point: point
            )
        }
        
        return DPYandexGeocoderSuccess(geoObjects: geoObjects)
    }
    
}

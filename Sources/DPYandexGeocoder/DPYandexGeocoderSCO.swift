//
//  DPYandexGeocoderSCO.swift
//  
//
//  Created by Дмитрий Поляков on 07.10.2022.
//

import Foundation

/// Порядок записи координат.
public enum DPYandexGeocoderSCO: String {
    
    /// долгота, широта
    case longlat = "longlat"
    
    /// широта, долгота
    case latlong = "latlong"
    
    public static let `default`: DPYandexGeocoderSCO = .longlat
}

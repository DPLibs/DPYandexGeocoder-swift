//
//  DPYandexCoordinates.swift
//  
//
//  Created by Дмитрий Поляков on 14.12.2022.
//

import Foundation

/// Географические координаты.
public struct DPYandexCoordinates {
    
    // MARK: - Init
    public init(longitude: Double, latitude: Double) {
        self.longitude = longitude
        self.latitude = latitude
    }
    
    // MARK: - Props
    /// Долгота
    public var longitude: Double
    
    /// Широта
    public var latitude: Double
}

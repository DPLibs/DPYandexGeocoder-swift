//
//  DPYandexSPN.swift
//  
//
//  Created by Дмитрий Поляков on 14.12.2022.
//

import Foundation

/// Протяженность области поиска. Центр области задается параметром ll.
/// Задается двумя числами:
/// - первое обозначает разницу между максимальной и минимальной долготой области;
/// - второе обозначает разницу между максимальной и минимальной широтой области.
public struct DPYandexSPN {
    
    // MARK: - Init
    public init(longitudeLength: Double, latitudeLength: Double) {
        self.longitudeLength = longitudeLength
        self.latitudeLength = latitudeLength
    }
    
    // MARK: - Props
    public var longitudeLength: Double
    public var latitudeLength: Double
    
    public var stringValue: String {
        "\(self.longitudeLength),\(self.latitudeLength)"
    }
}

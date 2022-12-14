//
//  DPYMGeocode.swift
//  
//
//  Created by Дмитрий Поляков on 14.12.2022.
//

import Foundation

/// Адрес либо географические координаты искомого объекта. Указанные данные определяют тип геокодирования:
/// Если указан адрес, то он преобразуется в координаты объекта. Этот процесс называется прямым геокодированием.
/// Если указаны координаты, они преобразуются в адрес объекта. Этот процесс называется обратным геокодированием.
/// Доступны несколько форматов записи координат.
public struct DPYMGeocode {
    
    // MARK: - Init
    public init(longitude: Double, latitude: Double) {
        self.stringValue = "\(longitude),\(latitude)"
    }
    
    public init(stringValue: String) {
        self.stringValue = stringValue
    }
    
    // MARK: - Props
    public var stringValue: String
}

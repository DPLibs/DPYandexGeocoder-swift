//
//  DPYMSearchText.swift
//  
//
//  Created by Дмитрий Поляков on 14.12.2022.
//

import Foundation

/// Текст поискового запроса. Например, название географического объекта, адрес, координаты, название организации, телефон.
/// Примеры (приведены без URL-кодирования):
/// text=лебединое озеро
/// text=55.750788,37.618534
/// text=Санкт-Петербург, ул. Блохина, 15
/// text=+7 495 739-70-70
/// text=ООО Яндекс
public struct DPYMSearchText {
    
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

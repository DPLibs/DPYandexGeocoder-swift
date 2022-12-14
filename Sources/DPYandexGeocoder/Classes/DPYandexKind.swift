//
//  DPYandexKind.swift
//  
//
//  Created by Дмитрий Поляков on 14.12.2022.
//

import Foundation

/// Вид топонима
public enum DPYandexKind: String {
    
    /// отдельный дом
    case house = "house"

    /// улица
    case street = "street"

    /// станция метро
    case metro = "metro"

    /// район города
    case district = "district"

    /// населённый пункт: город / поселок / деревня / село и т. п.
    case locality = "locality"

    /// район области
    case area = "area"

    /// область
    case province = "province"

    /// страна
    case country = "country"

    /// река / озеро / ручей / водохранилище и т.п.
    case hydro = "hydro"

    /// ж.д. станция
    case railway = "railway"
    
    /// линия метро / шоссе / ж.д. линия
    case route = "route"
    
    /// лес / парк / сад и т. п.
    case vegetation = "vegetation"

    /// аэропорт
    case airport = "airport"

    /// прочее
    case other = "other"
}

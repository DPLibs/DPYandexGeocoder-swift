//
//  DPYMrspn.swift
//  
//
//  Created by Дмитрий Поляков on 14.12.2022.
//

import Foundation

/// Флаг, задающий ограничение поиска указанной областью. Область задается параметрами ll и spn либо bbox.
public enum DPYMrspn: Int {
    
    /// не ограничивать поиск
    case notLimit = 0
    
    /// ограничивать поиск
    case withLimit = 1
}

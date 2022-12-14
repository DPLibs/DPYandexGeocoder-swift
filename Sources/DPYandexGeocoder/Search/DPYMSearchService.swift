//
//  File.swift
//  
//
//  Created by Дмитрий Поляков on 14.12.2022.
//

import Foundation

open class DPYMSearchService: DPYMService<DPYMSearchRequest, DPYMSearchSuccessMapper> {
    
    public init(isDPLoggingEnabled: Bool = false) {
        super.init(mapper: DPYMSearchSuccessMapper(), isDPLoggingEnabled: isDPLoggingEnabled)
    }
    
}

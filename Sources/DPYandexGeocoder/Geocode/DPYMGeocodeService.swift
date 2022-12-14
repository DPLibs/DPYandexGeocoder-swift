//
//  DPYMGeocodeService.swift
//  
//
//  Created by Дмитрий Поляков on 07.10.2022.
//

import Foundation

open class DPYMGeocodeService: DPYMService<DPYMGeocodeRequest, DPYMGeocodeSuccessMapper> {
    
    public init(isDPLoggingEnabled: Bool = false) {
        super.init(mapper: DPYMGeocodeSuccessMapper(), isDPLoggingEnabled: isDPLoggingEnabled)
    }
    
}

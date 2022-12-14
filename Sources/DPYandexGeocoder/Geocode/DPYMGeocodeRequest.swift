//
//  DPYMGeocodeRequest.swift
//  
//
//  Created by Дмитрий Поляков on 07.10.2022.
//

import Foundation

public struct DPYMGeocodeRequest {
    
    // MARK: - Init
    public init(
        apikey: String,
        geocode: DPYMGeocode,
        urlString: String = DPYMConstants.geocodeURLString,
        kind: Kind? = nil,
        rspn: DPYMrspn? = nil,
        ll: DPYMCoordinates? = nil,
        spn: DPYMspn? = nil,
        bbox: String? = nil,
        results: Int? = nil,
        skip: Int? = nil,
        lang: DPYMLang? = nil,
        callback: String? = nil
    ) {
        self.urlString = urlString
        self.apikey = apikey
        self.geocode = geocode
        self.kind = kind
        self.rspn = rspn
        self.ll = ll
        self.spn = spn
        self.bbox = bbox
        self.results = results
        self.skip = skip
        self.lang = lang
        self.callback = callback
    }
    
    // MARK: - Props
    public var urlString: String
    
    /// Ключ, полученный в Кабинете разработчика
    public var apikey: String
    
    /// Адрес либо географические координаты искомого объекта. Указанные данные определяют тип геокодирования:
    /// Если указан адрес, то он преобразуется в координаты объекта. Этот процесс называется прямым геокодированием.
    /// Если указаны координаты, они преобразуются в адрес объекта. Этот процесс называется обратным геокодированием.
    /// Доступны несколько форматов записи координат.
    public var geocode: DPYMGeocode
    
    /// Только если в параметре geocode указаны координаты. Вид необходимого топонима. Если параметр не задан, API выберет тип топонима автоматически.
    public var kind: Kind?
    
    /// Флаг, задающий ограничение поиска указанной областью. Область задается параметрами ll и spn либо bbox. Значение по умолчению: 0.
    public var rspn: DPYMrspn?
    
    /// Долгота и широта центра области поиска. Протяженность области поиска задается параметром spn.
    public var ll: DPYMCoordinates?
    
    /// Протяженность области поиска. Центр области задается параметром ll.
    /// Задается двумя числами:
    /// - первое обозначает разницу между максимальной и минимальной долготой области;
    /// - второе обозначает разницу между максимальной и минимальной широтой области.
    public var spn: DPYMspn?
    
    /// Альтернативный способ задания области поиска.
    ///  Границы задаются в виде географических координат (в последовательности «долгота, широта») левого нижнего и правого верхнего углов области.
    /// Формат записи: bbox=x1,y1~x2,y2
    public var bbox: String?
    
    /// Формат ответа геокодера.
    public var format: String = "json"
    
    /// Максимальное количество возвращаемых объектов. Если указан параметр skip то значение нужно задать явно.
    /// Значение по умолчанию: 10.
    /// Максимальное допустимое значение: 100.
    public var results: Int?
    
    /// Количество пропускаемых объектов в ответе, начиная с первого. Если указано, нужно также задать значение results. Значение skip должно нацело делиться на значение results.
    /// Значение по умолчанию: 0.
    public var skip: Int?
    
    /// Язык ответа и региональные особенности карты.
    /// Формат записи: lang=language_region
    /// - language — двузначный код языка. Указывается в формате ISO 639-1. Задает язык, на котором будут отображаться названия географических объектов.
    /// - region — двузначный код страны. Указывается в формате ISO 3166-1. Определяет региональные особенности.
    /// Значение по умолчанию: ru_RU.
    public var lang: DPYMLang?
    
    /// Имя JavaScript-функции, которой передается ответ геокодера (в соответствии с соглашениями JSONP).
    /// Параметр учитывается только если ответ возвращается в формате JSON.
    public var callback: String?
    
}

// MARK: - Kind
public extension DPYMGeocodeRequest {
    
    /// Только если в параметре geocode указаны координаты. Вид необходимого топонима. Если параметр не задан, API выберет тип топонима автоматически
    enum Kind: String {
        
        /// дом
        case house = "house"
        
        /// улица
        case street = "street"
        
        /// станция метро
        case metro = "metro"
        
        /// район города
        case district = "district"
        
        /// населенный пункт (город/поселок/деревня/село/...)
        case locality = "locality"
    }
    
}

// MARK: - DPYandexRequestGeneratorFactory
extension DPYMGeocodeRequest: DPYMRequestFactory {
    
    public func generateURLRequest() throws -> URLRequest {
        guard var urlComponents = URLComponents(string: self.urlString) else {
            throw DPYMError.failedGenerateURLRequest
        }
        
        var urlQueryItems: [URLQueryItem] = [
            URLQueryItem(name: "apikey", value: self.apikey),
            URLQueryItem(name: "geocode", value: self.geocode.stringValue),
            URLQueryItem(name: "format", value: self.format),
            URLQueryItem(name: "sco", value: "longlat")
        ]
        
        if let kind = self.kind {
            urlQueryItems += [ URLQueryItem(name: "kind", value: kind.rawValue) ]
        }
        
        if let rspn = self.rspn {
            urlQueryItems += [ URLQueryItem(name: "rspn", value: rspn.rawValue.description) ]
        }
        
        if let ll = self.ll {
            urlQueryItems += [ URLQueryItem(name: "ll", value: "\(ll.longitude),\(ll.latitude)") ]
        }
        
        if let spn = self.spn {
            urlQueryItems += [ URLQueryItem(name: "spn", value: spn.stringValue) ]
        }
        
        if let bbox = self.bbox {
            urlQueryItems += [ URLQueryItem(name: "bbox", value: bbox) ]
        }
        
        if let results = self.results {
            urlQueryItems += [ URLQueryItem(name: "results", value: results.description) ]
        }
        
        if let skip = self.skip {
            urlQueryItems += [ URLQueryItem(name: "skip", value: skip.description) ]
        }
        
        if let lang = self.lang {
            urlQueryItems += [ URLQueryItem(name: "lang", value: lang.rawValue) ]
        }
        
        if let callback = self.callback {
            urlQueryItems += [ URLQueryItem(name: "callback", value: callback) ]
        }
        
        urlComponents.queryItems = urlQueryItems
        
        guard let url = urlComponents.url else {
            throw DPYMError.failedGenerateURLRequest
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        return urlRequest
    }
    
}

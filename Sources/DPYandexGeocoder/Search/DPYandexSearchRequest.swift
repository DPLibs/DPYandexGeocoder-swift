//
//  DPYandexSearchRequest.swift
//  
//
//  Created by Дмитрий Поляков on 14.12.2022.
//

import Foundation

public struct DPYandexSearchRequest {
    
    // MARK: - Init
    public init(
        apikey: String,
        text: DPYandexSearchText,
        urlString: String = DPYandexConstants.searchURLString,
        lang: DPYandexLang = .ru_RU,
        type: DPYandexSearchType? = nil,
        ll: DPYandexCoordinates? = nil,
        spn: DPYandexSPN? = nil,
        bbox: String? = nil,
        rspn: DPYandexRSPN? = nil,
        results: Int? = nil,
        skip: Int? = nil,
        callback: String? = nil
    ) {
        self.apikey = apikey
        self.text = text
        self.urlString = urlString
        self.lang = lang
        self.type = type
        self.ll = ll
        self.spn = spn
        self.bbox = bbox
        self.rspn = rspn
        self.results = results
        self.skip = skip
        self.callback = callback
    }
    
    // MARK: - Props
    public var urlString: String
    
    /// Ключ для доступа к сервису. Получение ключей и управление ими производится в кабинете разработчика (https://developer.tech.yandex.ru).
    public var apikey: String
    
    /// Текст поискового запроса. Например, название географического объекта, адрес, координаты, название организации, телефон.
    /// Примеры (приведены без URL-кодирования):
    /// text=лебединое озеро
    /// text=55.750788,37.618534
    /// text=Санкт-Петербург, ул. Блохина, 15
    /// text=+7 495 739-70-70
    /// text=ООО Яндекс
    public var text: DPYandexSearchText
    
    /// Язык ответа и региональные особенности карты.
    /// Формат записи: lang=language_region
    /// - language — двузначный код языка. Указывается в формате ISO 639-1. Задает язык, на котором будут отображаться названия географических объектов.
    /// - region — двузначный код страны. Указывается в формате ISO 3166-1. Определяет региональные особенности.
    /// Значение по умолчанию: ru_RU.
    public var lang: DPYandexLang
    
    /// Типы возвращаемых результатов.
    /// Если не задано— автоматическое определения типа по тексту запроса.
    public var type: DPYandexSearchType?
    
    /// Центр области поиска. Определяется с помощью долготы и широты, разделенных запятой. Долгота и широта указываются в градусах, представленных в виде десятичной дроби.
    /// Используется совместно с параметром spn, определяющим размеры области поиска.
    /// Игнорируется при обратном геокодировании.
    public var ll: DPYandexCoordinates?
    
    /// Размеры области поиска. Определяется с помощью протяженностей по долготе и широте, разделенных запятой. Протяженности указываются в градусах, представленных в виде десятичной дроби.
    /// Используется совместно с параметром ll, определяющим центр области поиска.
    /// Игнорируется при обратном геокодировании.
    public var spn: DPYandexSPN?
    
    /// Альтернативный способ задания области поиска (см. ll+spn).
    /// Границы области поиска задаются в виде географических координат (в последовательности «долгота, широта») левого нижнего и правого верхнего углов области.
    public var bbox: String?
    
    /// Флаг, задающий ограничение поиска указанной областью. Область задается параметрами ll и spn либо bbox.
    /// Значение по умолчению: 0.
    public var rspn: DPYandexRSPN?
    
    /// Количество возвращаемых объектов.
    /// По умолчанию — 10.
    /// Максимальное допустимое значение — 500.
    /// Если указан параметр skip, то значение нужно задать явно.
    public var results: Int?
    
    /// Количество объектов в ответе (начиная с первого), которое необходимо пропустить.
    /// Максимальное допустимое значение — 1000.
    /// Если указан параметр skip, нужно также задать значение results. Значение skip должно нацело делиться на значение results.
    public var skip: Int?
    
    /// Имя JavaScript-функции, в которую будет передан ответ (в соответствии с соглашениями JSONP
    public var callback: String?
}

// MARK: - DPYandexRequestFactory
extension DPYandexSearchRequest: DPYandexRequestFactory {
    
    public func generateURLRequest() throws -> URLRequest {
        guard var urlComponents = URLComponents(string: self.urlString) else {
            throw DPYandexError.failedGenerateURLRequest
        }
        
        var urlQueryItems: [URLQueryItem] = [
            URLQueryItem(name: "apikey", value: self.apikey),
            URLQueryItem(name: "text", value: self.text.stringValue),
            URLQueryItem(name: "lang", value: self.lang.rawValue)
        ]
        
        if let type = self.type {
            urlQueryItems += [ URLQueryItem(name: "type", value: type.rawValue) ]
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
        
        if let rspn = self.rspn {
            urlQueryItems += [ URLQueryItem(name: "rspn", value: rspn.rawValue.description) ]
        }
        
        if let results = self.results {
            urlQueryItems += [ URLQueryItem(name: "results", value: results.description) ]
        }
        
        if let skip = self.skip {
            urlQueryItems += [ URLQueryItem(name: "skip", value: skip.description) ]
        }
        
        if let callback = self.callback {
            urlQueryItems += [ URLQueryItem(name: "callback", value: callback) ]
        }
        
        urlComponents.queryItems = urlQueryItems
        
        guard let url = urlComponents.url else {
            throw DPYandexError.failedGenerateURLRequest
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        return urlRequest
    }
    
}

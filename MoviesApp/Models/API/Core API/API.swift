//
//  API.swift
//  MoviesApp
//
//  Created by Nguyễn Trí on 13/08/2021.
//

import Foundation

enum APIError: Error {
    
    case error(String)
    case errorURL
    
    var localziedDescription: String {
        switch self {
        case .error(let string):
            return string
        case .errorURL:
            return "URL String is error."
        }
    }
}


typealias Completion = (Bool, String) -> Void

typealias APICompletion<T> = (Result<T, APIError>) -> Void

enum APIResult {
    case success(Data?)
    case failure(APIError)
}


struct API {
    static var sharedAPI: API = {
        let api = API()
        return api
    }()
    
    static func shared() -> API {
        return sharedAPI
    }
    
    private init() {}
}

//
//  Data.swift
//  MoviesApp
//
//  Created by Nguyễn Trí on 13/08/2021.
//

import Foundation


typealias JSON = [String: Any]

extension Data {
    
    func toJSON() -> JSON {
        var json: [String: Any] = [:]
        
        do {
            if let jsonObj = try JSONSerialization.jsonObject(with: self, options: .mutableContainers) as? JSON {
                json = jsonObj
            }
        }
        catch {
            print("Json casting error.")
        }
        return json
    }
}

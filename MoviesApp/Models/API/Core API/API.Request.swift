//
//  API.Request.swift
//  MoviesApp
//
//  Created by Nguyễn Trí on 13/08/2021.
//

import Foundation

extension API {
    
    // urlString
    func request(urlString: String, completion: @escaping (APIResult) -> Void ) {
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(.error(error.localizedDescription)))
                } else {
                    if let data = data {
                        completion(.success(data))
                    }
                }
                    
                }
            }
            dataTask.resume()
        }
    
}


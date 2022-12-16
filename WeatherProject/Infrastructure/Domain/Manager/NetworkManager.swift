//
//  ApiManeger.swift
//  Weather
//
//  Created by Tiko Janikashvili on 06.12.22.
//

import Foundation

enum EndPoint: String {
    case url = "https://api.weatherapi.com/v1/forecast.json?key=f56580404c7f486abcc204951220612&q=Tbilisi&days=10&aqi=yes&alerts=no"
}

typealias completionBlock<T: Codable> = ((Result<T, Error>) -> Void)

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    // MARK: - Generic function
    func get<T: Codable>(url: String, completion: @escaping completionBlock<T>) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else { return }
            
            do {
                let decoder = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoder))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

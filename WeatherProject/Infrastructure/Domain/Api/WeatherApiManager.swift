//
//  WeatherApiManager.swift
//  Weather
//
//  Created by Tiko Janikashvili on 12.12.22.
//

import Foundation

protocol WeatherManagerProtocol: AnyObject {
    func fetchCuttentWeather(with endPoint: EndPoint, completion: @escaping (Weather) -> Void)
    func fetchDaysAndHours(with endPoint: EndPoint, completion: @escaping ([Forecastday]) -> Void)
}


class WeatherApiManager: WeatherManagerProtocol {
    func fetchDaysAndHours(with endPoint: EndPoint, completion: @escaping ([Forecastday]) -> Void) {
        let urlString = endPoint.rawValue
        
        NetworkManager.shared.get(url: urlString) { (result: Result<Weather, Error>) in
            switch result {
            case .success(let array):
                completion(array.forecast.forecastday)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchCuttentWeather(with endPoint: EndPoint, completion: @escaping ((Weather) -> Void)) {
        let urlString = endPoint.rawValue
        
        NetworkManager.shared.get(url: urlString) { (result: Result<Weather,Error>) in
            switch result {
            case .success(let weather):
                completion(weather)
            case .failure(let error):
                print(error)
            }
        }
    }
}

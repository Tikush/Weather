//
//  Weather.swift
//  Weather
//
//  Created by Tiko Janikashvili on 05.12.22.
//

struct Weather: Codable {
    let location: Location
    let current: CurrentTime
    let forecast: Forecast
}

struct Location: Codable {
    let name: String
    let localtime: String
}

struct CurrentTime: Codable {
    let temp: Int
    let isDay: Int
    let condition: Condition
    
    enum CodingKeys: String, CodingKey {
        case temp = "temp_c"
        case isDay = "is_day"
        case condition
    }
    
    struct Condition: Codable {
        let text: String
        let icon: String
    }
}

struct Forecast: Codable {
    let forecastday: [Forecastday]
}

struct Forecastday: Codable {
    let date: String
    let day: Day
    let hour: [Hour]
}

struct Day: Codable {
    let minTemp: Double
    let maxTemp: Double
    
    enum CodingKeys: String, CodingKey {
        case minTemp = "mintemp_c"
        case maxTemp = "maxtemp_c"
    }
}

struct Hour: Codable {
    let time: String
    let temp: Double
    let condition: Condition
    
    enum CodingKeys: String, CodingKey {
        case time
        case temp = "temp_c"
        case condition
    }
    
    struct Condition: Codable {
        let text: String
        let icon: String
        let code: Int
    }
}

//
//  Constants.swift
//  SimpleWeatherApp
//
//  Created by moonkey on 2023/02/28.
//

import Foundation

public struct WeatherAPI {
    static let requestURL = "https://api.openweathermap.org/data/2.5/weather?"
    static let params = "lat=37.5&lon=127"
    static let celcius = "°C"
    private init() {}
}

public struct WeatherDescriptionAPI {
    static let sunnyDesc = "근교 드라이브각"
    static let rainDesc = "비오는 날 서행 운전"
    static let snowDesc = "체인없이 운전 불가"
    static let cloudDesc = "방어운전 안전운전"
    
    static func calcDesc(mainDescription: String) -> String{
        if mainDescription == "Snow" {
            return snowDesc
        } else if mainDescription == "Rain" {
            return rainDesc
        } else if mainDescription == "Clouds" {
            return cloudDesc
        } else if mainDescription == "Sunny" {
            return sunnyDesc
        }
        return sunnyDesc
    }
    private init() {}
}

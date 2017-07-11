//
//  CurrentWeather.swift
//  WeatherMadrid
//
//  Created by Margaret Lopez Calderon on 3/7/17.
//  Copyright © 2017 Lopez, Margaret. All rights reserved.
//

import Foundation
import Alamofire




class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today,\(currentDate)"
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func donwloadDataWeather(completed: @escaping DonwloadCompleted)  {
        // Alamofire donwload
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL_BY_CITY)
        Alamofire.request(currentWeatherURL!).responseJSON { response in
            let result = response.result
            if let dictionary = result.value as? Dictionary<String, AnyObject>{
                if let name = dictionary["name"] as? String {
                    self._cityName = name.capitalized
                    print (self._cityName)

                }
                if let weather = dictionary["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)

                    }
                }
                if let main = dictionary["main"] as? Dictionary<String, AnyObject> {
                    if let currentTemp = main["temp"] as? Double {
                        let kevinToFarenheitPreDivision = (currentTemp * (9/5) - 459.67)
                        let kevinToFarenheit = Double(round(10 * kevinToFarenheitPreDivision/10))
                        self._currentTemp = kevinToFarenheit
                        print(self._currentTemp)
                    }
                }
            }
            completed()
        }
    }
}

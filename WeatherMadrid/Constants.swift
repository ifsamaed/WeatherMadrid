//
//  Constants.swift
//  WeatherMadrid
//
//  Created by Margaret Lopez Calderon on 3/7/17.
//  Copyright © 2017 Lopez, Margaret. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let CITY = "q="
let APP_ID = "&appid="
let API_KEY = "8f3f3f3836a6e6d2d5d18f8ddb71813b"

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)-36\(LONGITUDE)123\(APP_ID)\(API_KEY)"
let CURRENT_WEATHER_URL_BY_CITY = "\(BASE_URL)\(CITY)London,uk\(APP_ID)\(API_KEY)"

typealias DonwloadCompleted = () -> ()

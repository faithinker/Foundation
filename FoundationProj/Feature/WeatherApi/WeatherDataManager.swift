//
//  WeatherDataManager.swift
//  FoundationProj
//
//  Created by pineone on 2021/08/04.
//  Copyright © 2021 baedy. All rights reserved.
//

import Foundation
import Moya

// https://velog.io/@altmshfkgudtjr/Swift로-API-Request를-전송하기
// https://velog.io/@dlskawns96/Swift-간단한-날씨-앱-만들어보기-02-Swift-OpenWeatherMap



struct WheatherData: Decodable {
    let id: Int
    let name: String
    let weather: [Weather]
    let main: Main
    let wind: Wind

}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main: Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Double
    let humidity: Int
}

struct Wind: Decodable {
    let speed: Double
    let deg: Int
}

enum NetworkError: Error {
    case badUrl
    case noData
    case decodingError
}


class WeatherDataManager {
    static let shared: WeatherDataManager = WeatherDataManager()
    
    func getCurrentWeather(completion: @escaping (Result<WheatherData, NetworkError>) -> Void) {
        
        let Url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Seoul&APPID=2c0cd5b8de5641f4cffb6e68e7c5e000")
        
        guard let url = Url else { return completion(.failure(.badUrl)) }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return completion(.failure(.noData)) }
            
            let weatherResponse = try? JSONDecoder().decode(WheatherData.self, from: data)
            
            guard let weatherRes = weatherResponse else { return completion(.failure(.decodingError)) }
            completion(.success(weatherRes))
            
        }.resume()
        
       
    }
}

// https://greatpapa.tistory.com/66
// https://devmjun.github.io/archive/OpenWeather
// https://hcn1519.github.io/articles/2017-07/iOS_URLSession
// https://www.youtube.com/watch?v=Xc6q_JltHSI&ab_channel=iOSAcademy

// API Key : 2c0cd5b8de5641f4cffb6e68e7c5e000
// https://api.openweathermap.org/data/2.5/weather?q=Seoul&lang=kr&appid=2c0cd5b8de5641f4cffb6e68e7c5e000



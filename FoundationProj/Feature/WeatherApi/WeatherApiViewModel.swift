//
//  WeatherApiViewModel.swift
//  FoundationProj
//
//  Created by pineone on 2021/08/04.
//  Copyright (c) 2021 baedy. All rights reserved.
//

// 1. 검색어 입력 받아서 API 받아오기
// 2. 데이터 한번에 SetupDI로 받아서 뷰에서 세팅해주기


// ----------------------------
// 3. 테이블뷰 형태로 바꾸기
// 4. 저장해서 다음화면 넘어가서 테이블 뷰에

import UIKit
import RxCocoa
import RxSwift
import RxFlow
import Moya

class WeatherApiViewModel: ViewModelType, Stepper {
    // MARK: - Stepper
    var steps = PublishRelay<Step>()
    
    
    var weatherManager = WeatherDataManager()
    
    var weatherData = BehaviorRelay<WheatherData?>(value: nil)
    
    // 날씨
    var weatherDesc = BehaviorRelay<String>(value: "")
    // 온도
    var temp = BehaviorRelay<String>(value: "")
    // 습도
    var humidity = BehaviorRelay<Int>(value: 0)
    
    var feelsLike = PublishRelay<String>()
    
    
    // MARK: - ViewModelType Protocol
    typealias ViewModel = WeatherApiViewModel
    
    struct Input {
    }
    
    struct Output {
        let temp: BehaviorRelay<String>
        let weatherDesc: BehaviorRelay<String>
        let humidity: BehaviorRelay<Int>
        
        let feelsLike: PublishRelay<String>
    
        let weatherData: Observable<WheatherData?> //BehaviorRelay<WheatherData?>(value: nil)
    }
    
    func transform(req: ViewModel.Input) -> ViewModel.Output {
        getWeather()
        
        
        return Output(temp: temp,
                      weatherDesc: weatherDesc,
                      humidity: humidity,
                      feelsLike: feelsLike,
                      weatherData: weatherData.asObservable())
    }
    
    deinit {
        Log.d("\(self)!!")
    }
    
    func getWeather() {
        weatherManager.getCurrentWeather { result in
            switch result {
            case .success(let weatherResponse):
                DispatchQueue.main.async { [weak self] in
                    guard let `self` = self else { return }
                    self.weatherData.accept(weatherResponse)
                    
                    self.temp.accept(String(format: "%.1f", (weatherResponse.main.temp-32) * 1.8))
                    self.humidity.accept(weatherResponse.main.humidity)
                    self.weatherDesc.accept(weatherResponse.weather[0].description)
                    self.feelsLike.accept(String(format: "%.1f", weatherResponse.main.feels_like))
                    
                }
            case .failure(let error):
                Log.e("error - \(error)")
            }
        }
    }
}

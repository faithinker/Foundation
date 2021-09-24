//
//  WeatherApiView.swift
//  FoundationProj
//
//  Created by pineone on 2021/08/04.
//  Copyright (c) 2021 baedy. All rights reserved.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa



class WeatherApiView: UIBasePreviewType {
    
    // MARK: - Model type implemente
    typealias Model = Void
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        Log.d("\(self)!!")
    }
    
    // MARK: - View
    
    lazy var weatherImage = UIImageView().then { $0.image = UIImage(systemName: "trash.fill") }
    
    lazy var weatherDesc = Label().then { $0.initLabel() }
    
    lazy var temp = UILabel()
    
    lazy var humidity = UILabel()
    
    lazy var feelsLike = UILabel()
    

    
    // MARK: - Outlets
    
    // MARK: - Methods
    func setupLayout() {
        
        addSubviews([weatherImage, weatherDesc, temp, humidity, feelsLike])
        
        
        weatherImage.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-200)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(50)
        }
        
        weatherDesc.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-100)
            $0.centerX.equalToSuperview()
        }
        
        temp.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-50)
            $0.centerX.equalToSuperview()
        }
        
        humidity.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        feelsLike.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(50)
            $0.centerX.equalToSuperview()
        }
    }
    
    @discardableResult
    func setupDI(wheatherData: Observable<WheatherData?>) -> Self {
        wheatherData
            .subscribe(onNext: { [weak self] data in
                guard let data = data else { return }
                guard let `self` = self else { return }
                self.weatherDesc.text = "현재 날씨 : \(data.weather[0].description)"
                self.temp.text = "현재 온도 : \(round(data.main.temp * 10) / 10)"
                self.humidity.text = "습도 : \(data.main.humidity)"
                self.feelsLike.text = "체감온도 : \(data.main.feels_like)"
            }).disposed(by: rx.disposeBag)
        
        return self
    }
    
    @discardableResult
    func setupDI(feelsLike: PublishRelay<String>) -> Self {
        feelsLike
            .subscribe(onNext: { [weak self] sensibleTemperature in
                guard let `self` = self else { return }
                self.feelsLike.text = "체감온도 : " + sensibleTemperature
            }).disposed(by: rx.disposeBag)
        return self
    }

}

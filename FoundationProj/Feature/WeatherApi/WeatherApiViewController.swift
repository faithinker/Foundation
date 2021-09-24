//
//  WeatherApiViewController.swift
//  FoundationProj
//
//  Created by pineone on 2021/08/04.
//  Copyright (c) 2021 baedy. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable
import SnapKit
import Then

class WeatherApiViewController: UIBaseViewController, ViewModelProtocol {
    typealias ViewModel = WeatherApiViewModel
    
    // MARK: - ViewModelProtocol
    var viewModel: ViewModel!
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupLayout()
        bindingViewModel()
    }
    
    deinit {
        Log.d("\(self)!!")
    }
    
    // MARK: - Binding
    func bindingViewModel() {
        let response = viewModel.transform(req: ViewModel.Input())
        
        subView
            .setupDI(wheatherData: response.weatherData)
            
    }
    
    // MARK: - View
    let subView = WeatherApiView()
    
    func setupLayout() {
        self.view.addSubview(subView)
        subView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
}

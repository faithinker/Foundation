//
//  FloatingPanelViewController.swift
//  FoundationProj
//
//  Created by pineone on 2021/08/18.
//  Copyright (c) 2021 baedy. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable
import SnapKit
import Then
import FloatingPanel

class FloatingPanelViewController: UIBaseViewController, ViewModelProtocol {
    typealias ViewModel = FloatingPanelViewModel
    
    // MARK: - ViewModelProtocol
    var viewModel: ViewModel!
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupLayout()
        bindingViewModel()
        binding()
    }
    
    // MARK: - Binding
    func bindingViewModel() {
        _ = viewModel.transform(req: ViewModel.Input())
    }
    

    
    // MARK: - View
    let subView = FloatingPanelView()
    
    func setupLayout() {
        self.view.addSubview(subView)
        subView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    func binding() {
//        subView.panelView.delegate = self
//        subView.panelView.set(contentViewController: WeatherApiViewController())
//        subView.panelView.addPanel(toParent: self)
    }
}

extension FloatingPanelViewController: FloatingPanelControllerDelegate {
    
}

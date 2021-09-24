//
//  FlowLayoutViewModel.swift
//  FoundationProj
//
//  Created by pineone on 2021/08/04.
//  Copyright (c) 2021 baedy. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxFlow

class FlowLayoutViewModel: ViewModelType, Stepper {
    // MARK: - Stepper
    var steps = PublishRelay<Step>()
    
    // MARK: - ViewModelType Protocol
    typealias ViewModel = FlowLayoutViewModel
    
    struct Input {
    }
    
    struct Output {
    }
    
    func transform(req: ViewModel.Input) -> ViewModel.Output {
        return Output()
    }
}

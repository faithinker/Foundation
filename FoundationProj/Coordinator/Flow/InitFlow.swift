//
//  InitFlow.swift
//  FondationProj
//
//  Created by baedy on 2020/05/06.
//  Copyright © 2020 baedy. All rights reserved.
//

import RxFlow
import UIKit
import Then
import RxSwift
import RxCocoa

// 새로운 뷰 추가시 추가 동작해야 할 :  MainRepository Screen MainViewModel AppStep

class InitFlow: Flow {
    static let `shared`: InitFlow = InitFlow()

    var root: Presentable{
        return self.rootViewController
    }
    
    private lazy var rootViewController = NavigationController().then {
          $0.setNavigationBarHidden(false, animated: false)
      }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else {
            return .none
        }
        
        switch step {
        case .initialize:
            return navigateToMain()
        case .multiSelectTable:
            return navigateToMultiTable()
        case .multiSelectCollection:
            return navigateToMultiCollection()
        case .webSchemeTest:
            return navigateToWebTest()
        case .linkCollection:
            return navigateToLinkImageCollection()
        case .linkImageZoom(let urls, let index):
            return modalShowImageSlider(withItems: urls, initialIndex: index)
        case .close:
            return popView()
        case .assetImageZoom(let aseets, let index):
            return modalShowImageSlider(withItems: aseets, initialIndex: index)
        case .horizontalStackScroll:
            return navigateToHSS()
        case .rotate:
            return FlowSugar(RotateViewModel(), RotateViewController.self)
                .oneStepPushBy(self.rootViewController)
        case .playerSlider:
            return FlowSugar(PlayerViewModel(), PlayerViewController.self)
                .oneStepPushBy(self.rootViewController)
        case .filterSlider:
            return FlowSugar(FilterSliderViewModel(), FilterSliderViewController.self)
                .oneStepPushBy(self.rootViewController)
        case .rotateStackScroll:
            return FlowSugar(RotateSSViewModel(), RotateSSViewController.self)
            .oneStepPushBy(self.rootViewController)
        case .toastWithView:
            return FlowSugar(ToastShowViewModel(), ToastShowViewController.self)
                .oneStepPushBy(self.rootViewController)
        
        case .singleTable:
            return navigateToSingleTable()
        case .collection:
            return navigateToCollection()
        case .flowLayoutCollection:
            return navigateToCollection()
        case .compositionalLayout:
            return navigateToCompositionalLayout()
            
        case .weatherApi:
            return navigateToWeatherApi()
            
        case .floatingPanel:
            return navigateToFloatingPanel()
        default:
            return .none
        }
    }
}

extension InitFlow{
    private func navigateToWebTest() -> FlowContributors{
        FlowSugar(WebTestViewModel(), WebTestViewController.self)
            .navigationItem(with: {
                $0.title = "web scheme test"
            }).oneStepPushBy(self.rootViewController)
    }
    
    private func navigateToHSS() -> FlowContributors{
        FlowSugar(HorizontalStackScrollViewModel(), HorizontalStackScrollViewController.self)
            .navigationItem(with: {
                $0.title = "HorizontalStackScroll"
            }).oneStepPushBy(self.rootViewController)
    }
    
    private func navigateToMultiTable() -> FlowContributors{
        FlowSugar(TableMultiSelectionViewModel(), TableMultiSelectionViewController.self)
            .navigationItem(with:{
                $0.title = "multiSelectTable"
            }).oneStepPushBy(self.rootViewController)
    }
    
    private func navigateToMultiCollection() -> FlowContributors{
         FlowSugar(CollectionMultiSelectionViewModel(), CollectionMultiSelectionViewController.self)
             .navigationItem(with:{
                 $0.title = "multiSelectCollection"
             }).oneStepPushBy(self.rootViewController)
     }
    
    private func navigateToLinkImageCollection() -> FlowContributors{
        FlowSugar(LinkImageGridViewModel(), LinkImageGridViewController.self)
            .navigationItem(with:{
                $0.title = "LinkImageGrid"
            })
            .oneStepPushBy(self.rootViewController)
    }
    
    private func modalShowImageSlider<T>(withItems items: [T], initialIndex: Int) -> FlowContributors{
        
        FlowSugar(ZoomingViewModel(items, initialIndex), ZoomingViewController<T>.self)
            .setVCProperty(viewControllerBlock:{
                
                self.rootViewController.delegate = $0.transitionController
                $0.transitionController.animator.currentIndex = initialIndex
                                
                if let parentVC = UIApplication.shared.topViewController as? CollectionMultiSelectionViewController {
                    parentVC.zoomIndexDelegate = $0
                    $0.transitionController.fromDelegate = parentVC
                }
                if let parentVC = UIApplication.shared.topViewController as? LinkImageGridViewController {
                    parentVC.zoomIndexDelegate = $0
                    $0.transitionController.fromDelegate = parentVC
                }
                
                $0.transitionController.toDelegate = $0
            })
            .oneStepPushBy(self.rootViewController)
    }
    
    private func popView() -> FlowContributors{
        rootViewController.popViewController(animated: true)
        return .none
    }
     
    private func navigateToMain() -> FlowContributors{
        FlowSugar(MainViewModel(), MainViewController.self)
            .navigationItem(with: {
                $0.title = "Foundation"
            })
            .oneStepPushBy(self.rootViewController)
    }
    
    private func navigateToSingleTable() -> FlowContributors{
        FlowSugar(SingleTableViewModel(), SingleTableViewController.self)
            .navigationItem(with: {
                $0.title = "Single TableView"
            }).oneStepPushBy(self.rootViewController)
    }
    
    private func navigateToCollection() -> FlowContributors{
        FlowSugar(CollectionViewModel(), CollectionViewController.self)
            .navigationItem(with: {
                $0.title = "Basic CollectionView"
            }).oneStepPushBy(self.rootViewController)
    }
    
    private func navigateToFlowLayout() -> FlowContributors{
        FlowSugar(FlowLayoutViewModel(), FlowLayoutViewController.self)
            .navigationItem(with: {
                $0.title = "FlowLayout CollectionView"
            }).oneStepPushBy(self.rootViewController)
    }
    
    private func navigateToCompositionalLayout() -> FlowContributors{
        FlowSugar(FlowLayoutViewModel(), FlowLayoutViewController.self)
            .navigationItem(with: {
                $0.title = "CompositionalLayout CollectionView"
            }).oneStepPushBy(self.rootViewController)
    }
    
    private func navigateToWeatherApi() -> FlowContributors {
        FlowSugar(WeatherApiViewModel(), WeatherApiViewController.self)
            .navigationItem(with: {
                $0.title = "WeatherApi"
            }).oneStepPushBy(self.rootViewController)
    }
    
    private func navigateToFloatingPanel() -> FlowContributors {
        FlowSugar(FloatingPanelViewModel(), FloatingPanelViewController.self)
            .navigationItem(with: {
                $0.title = "FloatingPanel"
            }).oneStepPushBy(self.rootViewController)
    }
    
}


//
//  Screen.swift
//  FondationProj
//
//  Created by baedy on 2020/05/06.
//  Copyright © 2020 baedy. All rights reserved.
//

import Foundation

enum Screen {
    case multiTable
    case multiCollection
    case linkCollection
    case horizontalStackScroll
    case webTest
    case rotateView
    case playerSlider
    case filterSlider
    case rotateStackScroll
    case toastWithView
    
    // Custom
    case singleTable
    
    case collection
    case flowLayout
    case compositinalLayout
    
    case weatherApi
    case floatingPanel
    
    func getTitle() -> String{
        switch self {
        case .multiTable:
            return "Table Multi Select"
        case .multiCollection:
            return "Collection Multi Select"
        case .linkCollection:
            return "link Image Collection"
        case .horizontalStackScroll:
            return "Horizontal Stack Scroll"
        case .webTest:
            return "Web scheme test"
        case .rotateView:
            return "Rotate View"
        case .playerSlider:
            return "Player Slider"
        case .filterSlider:
            return "Filter Slider"
        case .rotateStackScroll:
            return "Rotate Stack Scroll"
        case .toastWithView:
            return "Toast With View"
            
            
        case .singleTable:
            return "Single Table View"
        case .collection:
            return "Basic CollectionView"
        case .flowLayout:
            return "FlowLayout CollectionView"
        case .compositinalLayout:
            return "CompositinalLayout CollectionView"
            
        case .weatherApi:
            return "Weather API"
            
        case .floatingPanel:
            return "FloatingPanel"

        }
    }
}

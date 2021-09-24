//
//  FloatingPanelView.swift
//  FoundationProj
//
//  Created by pineone on 2021/08/18.
//  Copyright (c) 2021 baedy. All rights reserved.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa
import FloatingPanel

class FloatingPanelView: UIBasePreviewType {
    
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
    
    // MARK: - View

    
    // MARK: - Outlets
    let panelView = FloatingPanelController() //WeatherApiView()
    
    
    // MARK: - Methods
    func setupLayout() {
        addSubview(panelView.view)
        
        panelView.view.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().dividedBy(2)
        }
        
    }
    
    

    
    func setupDI(observable: Observable<[Model]>) {
        // model Dependency Injection
    }
}


// MARK: - PreView
#if canImport(SwiftUI) && DEBUG
import SwiftUI

@available(iOS 13.0, *)
struct FloatingPanel_Previews: PreviewProvider {
    static var previews: some View {
        //        Group {
        //            ForEach(UIView.previceSupportDevices, id: \.self) { deviceName in
        //                DebugPreviewView {
        //                    return FloatingPanelView()
        //                }.previewDevice(PreviewDevice(rawValue: deviceName))
        //                    .previewDisplayName(deviceName)
        //                    .previewLayout(.sizeThatFits)
        //            }
        //        }        
        Group {
            DebugPreviewView {
                let view = FloatingPanelView()
                //                .then {
                //                    $0.setupDI(observable: Observable.just([]))
                //                }
                return view
            }
        }
    }
}
#endif

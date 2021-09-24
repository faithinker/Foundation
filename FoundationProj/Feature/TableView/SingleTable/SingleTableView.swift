//
//  SingleTableView.swift
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

class SingleTableView: UIBasePreviewType {
    
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
    lazy var tableview = UITableView().then {
//        $0.rx.setDelegate(self).disposed(by: rx.disposeBag)
        $0.delegate = self
        $0.dataSource = self
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.estimatedRowHeight = 100
        
        $0.rowHeight = UITableView.automaticDimension
        $0.register(cellType: SingleTableViewCell.self)
        
    }
    
    // MARK: - Outlets
    
    // MARK: - Methods
    func setupLayout() {
        addSubviews([tableview])
        
        tableview.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

    }
    
    func bindData() {
        
    }
    
    func setupDI(observable: Observable<[Model]>) {
        // model Dependency Injection
    }
}

extension SingleTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: "SingleTableViewCell", for: indexPath) as? SingleTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(" 선택한 셀의 index : \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}

// MARK: - PreView
#if canImport(SwiftUI) && DEBUG
import SwiftUI

@available(iOS 13.0, *)
struct SingleTable_Previews: PreviewProvider {
    static var previews: some View {
        //        Group {
        //            ForEach(UIView.previceSupportDevices, id: \.self) { deviceName in
        //                DebugPreviewView {
        //                    return SingleTableView()
        //                }.previewDevice(PreviewDevice(rawValue: deviceName))
        //                    .previewDisplayName(deviceName)
        //                    .previewLayout(.sizeThatFits)
        //            }
        //        }        
        Group {
            DebugPreviewView {
                let view = SingleTableView()
                //                .then {
                //                    $0.setupDI(observable: Observable.just([]))
                //                }
                return view
            }
        }
    }
}
#endif

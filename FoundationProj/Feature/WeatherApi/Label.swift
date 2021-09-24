//
//  Label.swift
//  FoundationProj
//
//  Created by pineone on 2021/08/13.
//  Copyright © 2021 baedy. All rights reserved.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class Label: UILabel {
    
    
    var normalFont: UIFont? {
        didSet {
            font = normalFont
        }
    }
    
    var normalColor: UIColor? {
        didSet {
            guard let color = normalColor else { return }
            textColor = color
        }
    }
    
    var normalBackgroundColor: UIColor? {
        didSet {
            guard let color = normalBackgroundColor else { return }
            backgroundColor = color
            return
        }
    }
    
    var normalBorderColor: UIColor? {
        didSet {
            guard let color = normalBorderColor else { return }
            borderColor = color
        }
    }
    
    var highlightedBorderColor: UIColor?
    
    var highlightedBackgroundColor: UIColor?
    
    var highlightedColor: UIColor?
    
}

extension Label {
    // 하이라이트 상태에서만 백그라운드 색깔과 보더 색깔 바꿈
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? highlightedBackgroundColor : normalBackgroundColor
            borderColor = isHighlighted ? highlightedBorderColor : normalBorderColor
            textColor = isHighlighted ? highlightedTextColor : normalColor
        }
    }
    
    
}

extension Label {
    func initLabel(title: String = "") {
        normalFont = UIFont.systemFont(ofSize: 23, weight: .bold)
        layer.borderWidth = 1
        layer.cornerRadius = 5
        normalColor = .blue
        normalBackgroundColor = .brown
        normalBorderColor = .cyan
        
        
        
        highlightedBackgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        highlightedTextColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        highlightedColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
    }
}



extension UIView {
    var borderColor: UIColor? {
        get {
            guard let cgColor = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: cgColor)
        }
        set { layer.borderColor = newValue?.cgColor }
    }
}

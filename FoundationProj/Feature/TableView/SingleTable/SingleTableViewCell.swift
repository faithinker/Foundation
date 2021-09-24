//
//  SingleTableViewCell.swift
//  FoundationProj
//
//  Created by pineone on 2021/08/04.
//  Copyright © 2021 baedy. All rights reserved.
//

import Reusable
import RxCocoa
import RxSwift
import UIKit

class SingleTableViewCell: UITableViewCell, Reusable {
    

    
    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - View
    lazy var thubmnailImage = UIImageView().then {
        $0.image = UIImage(systemName: "trash")
    }
    
    lazy var textContainer = UIView()
    
    lazy var name = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        $0.text = "테스트"
    }
    
    lazy var location = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        $0.textColor = .systemGray
        $0.text = "문래동"
    }
    
    lazy var enrolledTime = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        $0.textColor = .systemGray
        $0.text = "· 17초 전"
    }
    
    lazy var pirce = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    }
    
    // MARK: - Methods


    func setupLayout() {
        addSubviews([thubmnailImage, textContainer])
        textContainer.addSubviews([name, location, enrolledTime, pirce])
        
        thubmnailImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.size.equalTo(80)
            
        }
        
        textContainer.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(thubmnailImage.snp.trailing).offset(25)
        }
        
        name.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        location.snp.makeConstraints {
            $0.top.equalTo(name.snp.bottom).offset(5)
            $0.leading.equalToSuperview()
        }
        
        enrolledTime.snp.makeConstraints {
            $0.top.equalTo(name.snp.bottom).offset(5)
            $0.leading.equalTo(location.snp.trailing).offset(5)
        }
        
        pirce.snp.makeConstraints {
            $0.top.equalTo(location.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
        }
        
        
    }

}

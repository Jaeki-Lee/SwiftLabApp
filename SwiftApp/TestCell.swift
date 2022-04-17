//
//  TestCell.swift
//  SwiftApp
//
//  Created by jaeki lee on 2022/04/17.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift
import Then

class TestCell: UITableViewCell {
    
    let disposeBag = DisposeBag()
    
    let titleLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.text = "test"
    }
    
    let selfButton = UIButton().then {
        $0.backgroundColor = UIColor.clear
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(self.titleLabel)
        
        self.titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }

        self.bindInputs()
        self.bindOutputs()
    }
    
    private func bindInputs() {
        
    }
    
    private func bindOutputs() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render(title: String) {
        self.titleLabel.text = title
    }
    
}

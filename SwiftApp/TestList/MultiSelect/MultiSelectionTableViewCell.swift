//
//  MultiSelectionTableViewCell.swift
//  SwiftApp
//
//  Created by jaeki lee on 2022/07/24.
//

import UIKit

class MultiSelectionTableViewCell: UITableViewCell {
    
//    var customCellSeclted: Bool = false {
//        didSet {
//            if !customCellSeclted {
//                self.borderView.backgroundColor = .white
//            } else {
//                self.borderView.backgroundColor = .yellow
//            }
//        }
//    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        self.contentView.add(
            self.borderView.with(
                self.label
            )
        )
        
        self.borderView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-8)
        }
        
        self.label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    public let borderView = UIView().then {
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 32
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.backgroundColor = .white
    }
    
    public let label = UILabel().then {
        $0.textAlignment = .center
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            self.borderView.backgroundColor = .yellow
        } else {
            self.borderView.backgroundColor = .white
        }
    }
}


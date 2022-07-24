//
//  CollectionViewCell.swift
//  SwiftApp
//
//  Created by jaeki lee on 2022/07/21.
//

import UIKit
import SnapKit
import Then

class CollectionViewCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.backgroundColor = .yellow
            } else {
                self.backgroundColor = .white
            }
        }
    }
    
    let padding: CGFloat = 5
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    public let label = UILabel().then {
        $0.textColor = .darkText
        $0.minimumScaleFactor = 0.5
        $0.numberOfLines = 1
    }
    
    func commonInit() {
        self.backgroundColor = .white
        self.contentView.addSubview(label)
        
        self.label.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.edges.equalToSuperview().inset(padding)
        }
    }
}

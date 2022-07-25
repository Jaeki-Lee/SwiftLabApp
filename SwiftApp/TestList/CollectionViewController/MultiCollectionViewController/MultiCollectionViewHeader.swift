//
//  MultiCollectionViewHeader.swift
//  SwiftApp
//
//  Created by jaeki lee on 2022/07/26.
//

import UIKit
import SnapKit

class MultiCollectionViewHeader: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public let label = UILabel().then {
        $0.textColor = .darkText
        $0.minimumScaleFactor = 0.5
        $0.numberOfLines = 1
    }
    
    internal func createConstraints() {

        self.contentView.add(
            self.label
        )
        
        self.label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
    
    func setTitle(title: String) {
        self.label.text = title
    }
    
    static var reuseId: String {
        return NSStringFromClass(self)
    }

}

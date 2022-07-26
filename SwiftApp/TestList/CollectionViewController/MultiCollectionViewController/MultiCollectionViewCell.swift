//
//  MultiCollectionViewCell.swift
//  SwiftApp
//
//  Created by jaeki lee on 2022/07/26.
//

import UIKit

class MultiCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.view.backgroundColor = .yellow
            } else {
                self.view.backgroundColor = .white
            }
        }
    }
    
    private let view = UIView().then {
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 16
        $0.backgroundColor = .white
    }
    
    public let label = UILabel().then {
        $0.textColor = .darkText
        $0.minimumScaleFactor = 0.5
        $0.numberOfLines = 1
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: 14)
    }
    
    internal func createConstraints() {
        self.contentView.add(
            self.view.with(
                self.label
            )
        )
        
        self.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }


    func setValues(label: String)  {
        self.label.text = label
    }


    static var reuseId: String {
        return NSStringFromClass(self)
    }
    
}

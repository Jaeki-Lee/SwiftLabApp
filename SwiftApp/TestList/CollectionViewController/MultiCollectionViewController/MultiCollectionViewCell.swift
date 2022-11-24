//
//  MultiCollectionViewCell.swift
//  SwiftApp
//
//  Created by jaeki lee on 2022/07/26.
//

import UIKit
import SnapKit

protocol MultiCollectionViewCellDelegate {
    func showDatePicker()
}

class MultiCollectionViewCell: UICollectionViewCell {
    
    var delegate: MultiCollectionViewCellDelegate?
    
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
        $0.layer.cornerRadius = 12
        $0.backgroundColor = .white
    }
    
    public let label = UILabel().then {
        $0.textColor = .darkText
        $0.minimumScaleFactor = 0.5
        $0.numberOfLines = 1
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: 14)
    }
    
    public let dateLabel = UILabel().then {
        $0.textColor = .darkText
        $0.minimumScaleFactor = 0.5
        $0.numberOfLines = 1
        $0.textAlignment = .left
        $0.text = "(선택)"
        $0.font = UIFont.boldSystemFont(ofSize: 14)
    }
    
    lazy var button = UIButton().then {
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 12
        $0.backgroundColor = .clear
    }
    
    internal func createConstraintForNormal() {
        self.contentView.add(
            self.view.with(
                self.label
            )
        )
        
        self.view.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.label.snp.remakeConstraints { make in
            make.center.equalToSuperview()
        }
    }


    func setValueForNormal(label: String)  {
        self.label.text = label
    }
    
    internal func createConstraintForDatePicker() {
        self.contentView.add(
            self.view.with(
                self.dateLabel
            ),
            self.button
        )
        
        self.view.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }

        self.dateLabel.snp.remakeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.centerY.equalToSuperview()
        }

        self.button.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.button.addTarget {
            self.delegate?.showDatePicker()
        }
    }
    
    func setValueForDatePicker(label: String) {
        self.dateLabel.text = label
    }
    
    @objc func handleView() {
        print("handleView")
    }


    static var reuseId: String {
        return NSStringFromClass(self)
    }
    
    
    
}

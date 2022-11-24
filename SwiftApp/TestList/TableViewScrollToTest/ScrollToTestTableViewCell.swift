//
//  scrollToTestTableViewCell.swift
//  SwiftApp
//
//  Created by trost.jk on 2022/11/24.
//

import Foundation
import UIKit

class ScrollToTestTableViewCell: UITableViewCell {
    
    static var reuseId: String {
        return NSStringFromClass(self)
    }
    
    let label = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .black
        $0.text = ""
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.white
        
        self.contentView.add(self.label)
        
        self.label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func render(text: String) {
        self.label.text = text
    }
}

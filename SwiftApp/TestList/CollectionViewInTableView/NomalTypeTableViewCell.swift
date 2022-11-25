//
//  NomalTypeTableViewCell.swift
//  SwiftApp
//
//  Created by trost.jk on 2022/11/25.
//

import Foundation
import UIKit

class NomalTypeTableViewCell: UITableViewCell {
    
    static var reuseId: String {
        return NSStringFromClass(self)
    }
    
    let view = UIView().then {
        $0.backgroundColor = .red
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.white
        
        self.contentView.addSubview(self.view)
        
        self.view.snp.makeConstraints { make in
            make.height.width.equalTo(150)
            make.center.equalToSuperview()
        }
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


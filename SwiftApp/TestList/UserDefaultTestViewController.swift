//
//  UserDefault.swift
//  SwiftApp
//
//  Created by jaeki lee on 2022/04/18.
//

import UIKit
import Then
import SnapKit

class UserDefaultTestViewController: UIViewController {
    
    
    let label = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = UIColor.black
        $0.text = "test"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(self.label)
        
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
    }
}

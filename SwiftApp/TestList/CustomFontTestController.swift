//
//  CustomFontTestController.swift
//  SwiftApp
//
//  Created by trost.jk on 2022/07/06.
//

import UIKit
import Then
import SnapKit
import AddWith

class CustomFontTestController: UIViewController {
    
    let noFontUILabel = UILabel().then {
        $0.text = "테스트 폰트"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = UIColor.black
    }
    
    let customFontUILabel = UILabel().then {
        $0.text = "Test font"
//        $0.font = UIFont.universidad(size: 20)
        $0.font = UIFont(name: "UNIVERSIDADPERSONALUSE-Bold", size: 20)
        $0.textColor = UIColor.black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.view.add(noFontUILabel, customFontUILabel)
        
        noFontUILabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        customFontUILabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(noFontUILabel.snp.bottom).offset(100)
        }
        
        UIFont.familyNames.forEach({ familyName in
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            print(familyName, fontNames)
        })
    }
    
}

extension UIFont {
    enum Family: String {
        case Black, Bold, Light, Medium, Regular, Thin
    }
    
//    static func roboto(size: CGFloat = 10, family: Family = .Regular) -> UIFont {
//        return UIFont(name: "Roboto-\(family)", size: size)!
//    }
    
//    static func universidad(size: CGFloat = 10) -> UIFont {
//        return UIFont(name: "universidad", size: size)!
//    }
}



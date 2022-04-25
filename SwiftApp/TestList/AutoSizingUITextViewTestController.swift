//
//  AutoSizingUITextViewTestController.swift
//  SwiftApp
//
//  Created by trost.jk on 2022/04/25.
//

import UIKit
import SnapKit
import Then

class AutoSizingUITextViewTestController: UIViewController {
    
    let textView = UITextView().then {
        $0.backgroundColor = UIColor.lightGray
        $0.text = "Ffdsfsdfdsfdsfsdfsdfkmflnmkdsfnjdsnjfkdnfkdsnfkdnsfknsdkfnkdsnfksdnfksndkfnksfndkfnkdnfkdsnkfsdkfndsknfkdsnfkdnskfndkfnksdnfksndfkndskfnkdsnfksndkfndskfnkdsnfksndkfd"
        $0.textContainer.maximumNumberOfLines = 4
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(self.textView)
        self.textView.delegate = self
        
        self.textView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }
        
        //지정된 textView 의 text 에 맞게 textView resizing 
        self.textViewDidChange(textView)
    }
}

extension AutoSizingUITextViewTestController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: view.frame.width, height: .infinity)
        
        //대상객체의 sizeThatFits 에 매개변수로 들어온 사이즈를 잘라 적합한 크기를 계산하여 반환한다.
        let estimatedSize = textView.sizeThatFits(size)
        print(estimatedSize)
        textView.snp.updateConstraints { make in
            make.height.equalTo(estimatedSize.height)
        }
    }
}

//
//  ScrollViewTestController.swift
//  SwiftApp
//
//  Created by trost.jk on 2022/07/06.
//

import UIKit
import Then
import SnapKit
import AddWith

class ScrollViewTestController: UIViewController {
    
    let scrollView = UIScrollView().then {
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = false
    }
    
    let scrollContentView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    let redView = UIView().then {
        $0.backgroundColor = .red
    }
    
    let blueView = UIView().then {
        $0.backgroundColor = .blue
    }
    
    let notScrollView = UIView().then {
        $0.backgroundColor = .gray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1.ScrollView 셋팅
        self.view.addSubview(scrollView)
        self.view.addSubview(self.notScrollView)
        
        self.scrollView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(self.notScrollView.snp.top)
        }
        
        self.notScrollView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(100)
            make.bottom.equalToSuperview()
        }
        
        //2.ScrollView 에 ScrollContentView 셋팅 모든 방향을 같게 잡아준다?
        self.scrollView.addSubview(self.scrollContentView)
        //가로를 못움직이게 고정하고 싶으면 scrollView 의 width 을 같게 해서 고정,
        //세로를 못움직이게 고정하고 싶으면 scrollView 의 height 를 같게 해 고정한다.
        self.scrollContentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            //세로 고정
            make.width.equalToSuperview()
        }
        
        //3.ScrollContentView 에 Scroll 이 적용된 뷰들을 넣는다.
        self.scrollContentView.add(
            self.redView,
            self.blueView
        )
        
        self.redView.snp.makeConstraints { make in
            make.width.height.equalTo(150)
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
        }
        
        self.blueView.snp.makeConstraints { make in
            make.width.height.equalTo(150)
            make.top.equalTo(self.redView.snp.bottom).offset(1000)
            make.bottom.equalToSuperview().offset(-100)
            make.centerX.equalToSuperview()
        }
        
    }
    
}

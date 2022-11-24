//
//  Extention.swift
//  SwiftApp
//
//  Created by jaeki lee on 2022/04/18.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

extension Reactive where Base: UIButton {
    /// 버튼에 쓰로틀 추가한 버전의 탭 이벤트 핸들링
    public var throttleTap: Observable<ControlEvent<()>.Element> {
        return self.controlEvent(.touchUpInside)
            .throttle(.milliseconds(200), latest: false, scheduler: MainScheduler.instance)
    }
}

class ClosureSleeve {
    let closure: ()->()
    
    init (_ closure: @escaping ()->()) {
        self.closure = closure
    }
    
    @objc func invoke () {
        closure()
    }
}

extension UIControl {
    
    /// 타겟 추가
    ///
    /// - Parameters:
    ///   - controlEvents: 컨트롤 이벤트
    ///   - action: 액션
    func addTarget (controlEvents: UIControl.Event = .touchUpInside, action: @escaping ()->()) {
        let sleeve = ClosureSleeve(action)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, String(format: "[%d]", arc4random()), sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}

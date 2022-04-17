//
//  Extention.swift
//  SwiftApp
//
//  Created by jaeki lee on 2022/04/18.
//

import Foundation
import RxSwift
import RxCocoa

extension Reactive where Base: UIButton {
    /// 버튼에 쓰로틀 추가한 버전의 탭 이벤트 핸들링
    public var throttleTap: Observable<ControlEvent<()>.Element> {
        return self.controlEvent(.touchUpInside)
            .throttle(.milliseconds(200), latest: false, scheduler: MainScheduler.instance)
    }
}

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
    //escaping type
    let closure: () -> ()
    
    //closure 를 매개변수로 받아 초기화
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    //호출시 closure 실행
    @objc func invoke() {
        closure()
    }
}

extension UIControl {
    func addTarget(controlEvent: UIControl.Event = .touchUpInside, action: @escaping ()->()) {
        let sleeve = ClosureSleeve(closure: action)
        addTarget(sleeve, action: #selector(sleeve.invoke), for: controlEvent)
        objc_setAssociatedObject(self, String(format: "[%d]", arc4random()), sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}

extension UIView {
    func captureView() -> UIImage {
        return UIGraphicsImageRenderer(bounds: bounds).image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

extension UIScrollView {
    @objc func captureScrollView() -> UIImage {
        let originalOffset = contentOffset
        let originalZoomScale = zoomScale

        let renderer = UIGraphicsImageRenderer(size: contentSize)
        let image = renderer.image { rendererContext in
            let context = rendererContext.cgContext

            // Shift the context so that the entire scroll view content is rendered
            context.translateBy(x: -originalOffset.x, y: -originalOffset.y)

            // Apply the zoom scale
            context.scaleBy(x: originalZoomScale, y: originalZoomScale)

            // Render the scroll view hierarchy
            layer.render(in: context)
        }

        return image
    }
}

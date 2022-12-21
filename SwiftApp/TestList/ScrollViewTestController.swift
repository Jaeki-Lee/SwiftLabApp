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
import Photos
import PDFKit

class ScrollViewTestController: UIViewController {
    
    var isCaptureOn = false
    
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
    
    let captureButton = UIButton().then {
        $0.setTitle("캡쳐", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.borderWidth = 1.0
        $0.isHidden = true
    }
    
    init(isCaptureOn: Bool = false) {
        self.isCaptureOn = isCaptureOn
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
        if self.isCaptureOn {
            self.view.addSubview(self.captureButton)
            
            self.captureButton.isHidden = false
            captureButton.snp.makeConstraints { make in
                make.trailing.bottom.equalToSuperview().offset(-20)
                make.width.height.equalTo(50)
            }
        }
        
        self.captureButton.addTarget {
//            self.captureAndSaveViewImage()
            self.captureAndSaveImageToPDF()
        }
        
    }
    
    fileprivate func captureAndSaveViewImage() {
        
        PHPhotoLibrary.requestAuthorization { status in
            switch status {
            case .notDetermined:
                break
            case .restricted:
                break
            case .denied:
                break
            case .authorized:
                DispatchQueue.main.async {
//                    let image = self.scrollView.captureScrollView()
//                    let image = self.view.captureView()
                    let image = self.scrollContentView.captureView()
                    UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.saveImage(_:didFinishSavingWithError:contextInfo:)), nil)
                }
            case .limited:
                break
            @unknown default:
                break
            }
        }
    }
    
    @objc func saveImage(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
      if error != nil {
        print("\(error.debugDescription)")
      } else {
        print("save successfully")
      }
    }
    
    fileprivate func captureAndSaveImageToPDF() {
        
        DispatchQueue.main.async {
            let image = self.scrollContentView.captureView()
            
            let pdfDocument = PDFDocument()
            let pageSize = image.size
            let pdfPage = PDFPage(image: image)!
            pdfDocument.insert(pdfPage, at: 0)
            let data = pdfDocument.dataRepresentation()
            
            let fileManger = FileManager.default
            let docDirectory = fileManger.urls(for: .documentDirectory, in: .userDomainMask).first!
            let myIphoneDir = URL(fileURLWithPath: "On My iPhone")
            print(myIphoneDir)
            do {
                try fileManger.createDirectory(at: myIphoneDir, withIntermediateDirectories: false)
            } catch {
                print(error.localizedDescription)
            }
//            let fileURL = docDirectory.appendingPathComponent("test.text")
//            let test = "Test"
//
//            do {
//                try test.write(to: fileURL, atomically: true, encoding: .utf8)
//                let input = try String(contentsOf: fileURL)
//                print(input)
//            } catch {
//                print(error.localizedDescription)
//            }
            
//            if let fileUrl = docDirectory?.appendingPathComponent("image.pdf")
//            {
//                do {
//                    //같은 이름이라면 덮어 쓴다
//                    try data?.write(to: docDirectory)
//                } catch {
//                    print(error)
//                }
//            }
        }
    }
    
    func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        // just send back the first one, which ought to be the only one
        return paths[0]
    }
}

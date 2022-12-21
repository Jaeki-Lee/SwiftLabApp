//
//  CollectionViewInTableViewCell.swift
//  SwiftApp
//
//  Created by jaeki lee on 2022/07/21.
//

import UIKit
import Photos

class CustomTableViewController: UIViewController {
    
    let list = [String](repeating: "Label", count: 10)
    
    let tableViewCellID = "TableViewCell"
    
    var isCaptureOn: Bool
    
    public lazy var tableView = UITableView().then {
        $0.delegate = self
        $0.dataSource = self
        $0.estimatedRowHeight = 44
        $0.rowHeight = UITableView.automaticDimension
        $0.register(TableCell.self, forCellReuseIdentifier: tableViewCellID)
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
        view.addSubview(tableView)
        view.addSubview(captureButton)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        if self.isCaptureOn {
            self.captureButton.isHidden = false
            captureButton.snp.makeConstraints { make in
                make.trailing.bottom.equalToSuperview().offset(-20)
                make.width.height.equalTo(50)
            }
        }
        
        self.tableView.reloadData()
        
        self.captureButton.addTarget {
            self.captureAndSaveViewImage()
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
                    let image = self.tableView.captureScrollView()
//                    let image = self.view.captureView()
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
}

extension CustomTableViewController: UITableViewDelegate {
    
}

extension CustomTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellID, for: indexPath) as! TableCell
        cell.label.text = "\(list[indexPath.row]) \(indexPath.row)"
        
        //cell 안의 콜렉션뷰가 갱신이 된후 테이블뷰 갱신
        cell.frame = tableView.bounds
        cell.layoutIfNeeded()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let tableViewLabel = 20
//        let collectionViewCellHeight = 50
//        let rows = 2
//
//        let height = CGFloat((collectionViewCellHeight * rows) + tableViewLabel)
//
//        return height
        
        return UITableView.automaticDimension
    }
}

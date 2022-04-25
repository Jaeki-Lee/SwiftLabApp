//
//  HorizontalTableViewController.swift
//  SwiftApp
//
//  Created by trost.jk on 2022/04/18.
//

//import UIKit
//import SnapKit
//import Then
//
//class HorizontalTableViewController: UIViewController {
//
//    let dimView = UIView().then {
//        $0.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.32).cgColor
//    }
//
//    let titleLabel = UILabel().then {
//        $0.text = "촬영 버튼을 눌러 감정 한 컷을 남겨보세요!"
//        $0.textColor = UIColor.white
//        $0.font = UIFont.systemFont(ofSize: 16)
//    }
//
//    let emotionTableView = UITableView()
//    let emotionTableViewCellID = "emotionTableViewCellID"
//
//    fileprivate func setTableViewOption() {
//        self.emotionTableView.delegate = self
//        self.emotionTableView.dataSource = self
//        self.emotionTableView.estimatedRowHeight = UITableView.automaticDimension
//        self.emotionTableView.rowHeight = UITableView.automaticDimension
//        self.emotionTableView.separatorStyle = .none
//        self.emotionTableView.showsHorizontalScrollIndicator = false
//
//
//        self.testListView.register(TestCell.self, forCellReuseIdentifier: self.testListViewCellId)
//    }
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.view.backgroundColor = UIColor.white
//
//        self.setTableViewOption()
//
//    }
//
//}
//
//extension HorizontalTableViewController: UITableViewDelegate, UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        5
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//}
//
//class EmotionTableViewCell: UITableViewCell {
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func render() {
//
//    }
//}

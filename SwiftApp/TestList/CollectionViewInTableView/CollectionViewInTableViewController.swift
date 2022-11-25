//
//  CollectionViewInTableViewController.swift
//  SwiftApp
//
//  Created by trost.jk on 2022/11/25.
//

import SnapKit
import UIKit

class CollectionViewInTableViewController: UIViewController {
    
    var testArray = [String]()
    
    public lazy var tableView = UITableView().then {
        $0.backgroundColor = .white
        $0.delegate = self
        $0.dataSource = self

        $0.isScrollEnabled = true
        $0.showsVerticalScrollIndicator = true
        $0.separatorStyle = .singleLine
        $0.tintColor = .clear
//        $0.allowsSelection = true
        
        $0.register(ScrollToTestTableViewCell.self, forCellReuseIdentifier: ScrollToTestTableViewCell.reuseId)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...100 {
            self.testArray.append(String(i))
        }
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaInsets)
        }
        
        self.tableView.isUserInteractionEnabled = true
    }
    
    private func scrollToTop() {
        let topRow = IndexPath(row: 100, section: 0)
        
        self.tableView.scrollToRow(at: topRow, at: .top, animated: true)
    }
    
    private func scrollToMiddle() {
        let topRow = IndexPath(row: 100, section: 0)
        
        self.tableView.scrollToRow(at: topRow, at: .middle, animated: true)
    }
    
    private func scrollToBottom() {
        let topRow = IndexPath(row: 100, section: 0)
        
        self.tableView.scrollToRow(at: topRow, at: .bottom, animated: true)
    }
    
}

extension CollectionViewInTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: ScrollToTestTableViewCell.reuseId, for: indexPath) as! ScrollToTestTableViewCell
        
        cell.render(text: self.testArray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
}




//
//  CollectionViewInTableViewCell.swift
//  SwiftApp
//
//  Created by jaeki lee on 2022/07/21.
//

import UIKit

class CustomTableViewController: UIViewController {
    
    let list = [String](repeating: "Label", count: 10)
    
    let tableViewCellID = "TableViewCell"
    
    public lazy var tableView = UITableView().then {
        $0.delegate = self
        $0.dataSource = self
        $0.estimatedRowHeight = 44
        $0.rowHeight = UITableView.automaticDimension
        $0.register(TableCell.self, forCellReuseIdentifier: tableViewCellID)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.tableView.reloadData()
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableViewLabel = 20
        let collectionViewCellHeight = 50
        let rows = 2
        
        let height = CGFloat((collectionViewCellHeight * rows) + tableViewLabel)
        
        return height
    }
}

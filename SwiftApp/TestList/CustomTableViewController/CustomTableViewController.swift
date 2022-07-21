//
//  CollectionViewInTableViewCell.swift
//  SwiftApp
//
//  Created by jaeki lee on 2022/07/21.
//

import UIKit

class CustomTableViewController: UIViewController {
    
    public lazy var tableView = UITableView().then {
        $0.delegate = self
        $0.dataSource = self
        $0.estimatedRowHeight = 44
        $0.rowHeight = UITableViewAut
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

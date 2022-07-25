//
//  File.swift
//  SwiftApp
//
//  Created by jaeki lee on 2022/07/24.
//

import UIKit
import SnapKit

class MultiSelectTableViewController: UIViewController {
    
    let list = [String](repeating: "Label", count: 20)
    
    let tableViewCellId = "multiSelectTableViewCell"
    
    public lazy var tableView = UITableView().then {
        $0.delegate = self
        $0.dataSource = self
        $0.separatorStyle = .none
        $0.allowsMultipleSelection = true
        $0.allowsMultipleSelectionDuringEditing = true
        $0.estimatedRowHeight = 44
        $0.rowHeight = UITableView.automaticDimension
        $0.register(MultiSelectionTableViewCell.self, forCellReuseIdentifier: tableViewCellId)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.view.add(
            self.tableView
        )
        
        self.tableView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(150)
            make.leading.trailing.equalToSuperview()
        }
    }
    
}

extension MultiSelectTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        //cell 안에서 setSelected 로 셀 을 선택하면 선택 됐을 때만 들어오고 선택 해제 할때는 들어오지 않는다.
        print(indexPath.row)

    }
    
}

extension MultiSelectTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellId, for: indexPath) as! MultiSelectionTableViewCell
        
        cell.selectionStyle = .none
        
        cell.label.text = "\(list[indexPath.row])"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellHeight = CGFloat(56)
        
        return cellHeight
    }
}

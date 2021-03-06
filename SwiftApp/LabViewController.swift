//
//  LabViewController.swift
//  SwiftApp
//
//  Created by jaeki lee on 2022/04/18.
//

import Foundation
import UIKit
import SnapKit
import Then

class LabViewController: UIViewController {
    let listOfTest : [TestItem] = [
        TestItem(testSubject: "UserDefault", testObject: UserDefaultTestViewController()),
        TestItem(testSubject: "AutoSizing UITextView", testObject: AutoSizingUITextViewTestController()),
        TestItem(testSubject: "ScrollView", testObject: ScrollViewTestController()),
        TestItem(testSubject: "CustomFont", testObject: CustomFontTestController()),
        TestItem(testSubject: "CollectionCellInTableView", testObject: CustomTableViewController()),
        TestItem(testSubject: "MultiSelectTableViewController", testObject: MultiSelectTableViewController()),
        TestItem(testSubject: "MultiSectionCollectionVC", testObject: MultiCollectionViewController())
    ]
    
    //1
    let testListView = UITableView()
    let testListViewCellId = "testListViewCellId"
    
    //2
    fileprivate func setTableViewOption() {
        self.testListView.delegate = self
        self.testListView.dataSource = self
        self.testListView.estimatedRowHeight = UITableView.automaticDimension
        self.testListView.rowHeight = UITableView.automaticDimension
        self.testListView.separatorStyle = .none
        
        self.testListView.register(TestCell.self, forCellReuseIdentifier: self.testListViewCellId)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad")
        self.view.backgroundColor = UIColor.white
        
        self.navigationController?.navigationBar.topItem?.title = "Lab"
        
        
        self.setTableViewOption()
        
        self.view.addSubview(self.testListView)
        testListView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.bottom.top.equalToSuperview()
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("==== viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("==== viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("==== viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("==== viewDidDisappear")
    }

}


//3
extension LabViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listOfTest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let testItem = self.listOfTest[indexPath.row]
        
        let testTableViewCell = self.testListView.dequeueReusableCell(withIdentifier: self.testListViewCellId, for: indexPath) as! TestCell
        
        testTableViewCell.render(title: testItem.testSubject)
        
        return testTableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let testItem = self.listOfTest[indexPath.row]
        let testController = testItem.testObject
        
        self.navigationController?.pushViewController(testController, animated: true)
    }
}

struct TestItem {
    let testSubject: String
    let testObject: UIViewController
}


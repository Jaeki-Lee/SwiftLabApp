//
//  MultiCollectionViewController.swift
//  SwiftApp
//
//  Created by jaeki lee on 2022/07/26.
//

import UIKit
import SnapKit

struct Section {
    var sectionName: String
    var rowData: [String]
}

class MultiCollectionViewController: UIViewController {
    var sections = [Section]()

    public lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout().then {
//            $0.minimumLineSpacing = 5
//            $0.minimumInteritemSpacing = 5
            $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    ).then {
        $0.register(
            MultiCollectionViewHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MultiCollectionViewHeader.reuseId
        )
        $0.register(
            MultiCollectionViewCell.self,
            forCellWithReuseIdentifier: MultiCollectionViewCell.reuseId
        )
        $0.delegate = self
        $0.dataSource = self
        $0.isScrollEnabled = true
//        $0.allowsMultipleSelection = true
        $0.allowsMultipleSelection = false
//        $0.allowsMultipleSelectionDuringEditing = true
//        $0.allowsMultipleSelection = true
//        $0.allowsMultipleSelectionDuringEditing = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sections = [
            Section(sectionName: "SPACES", rowData: ["Air Conditioner", "Apple HomePod"]),
            Section(sectionName: "HOME APPLIANCES", rowData: ["Ceiling Fan", "Fan", "Desk Lamp", "Iron", "PC on Desk", "Plug", "Power Strip", "L", "Lorem", "Lorem", "Lorem"]),
        ]
        
        self.view.add(
            self.collectionView
        )
        
        self.collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension MultiCollectionViewController: UICollectionViewDataSource {
    //섹션 갯수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }
    
    //각 섹션 cell 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sections[section].rowData.count
    }
    
    //Header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let cell = self.collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: MultiCollectionViewHeader.reuseId,
                for: indexPath) as! MultiCollectionViewHeader
            cell.createConstraints()
            cell.setTitle(title: self.sections[indexPath.section].sectionName)
            return cell
        default:  fatalError("Unexpected element kind")
        }
    }
    
    //Cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(
            withReuseIdentifier: MultiCollectionViewCell.reuseId,
            for: indexPath) as! MultiCollectionViewCell

        cell.createConstraints()
        cell.setValues(label: self.sections[indexPath.section].rowData[indexPath.row])
        return cell
    }
}

extension MultiCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("==== selected section: \(indexPath.section) row: \(indexPath.row)")
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("==== selected cancel section: \(indexPath.section) row: \(indexPath.row)")
    }
}

extension MultiCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
    }

    //collection header 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: 284, height: 25)
    }
    
    //collectionCell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let textContent = self.sections[indexPath.section].rowData[indexPath.row]
        let textContentSize = textContent.size(withAttributes: [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)
        ])
        let padding = CGFloat(40)

        return CGSize(width: textContentSize.width + padding, height: 30)
        
        //tableView 셀 크기만큼 하면 tableView 와 비슷하게 사용
//        let screenSize = self.view.frame.size
//        let width = screenSize.width - 40
//
//        return CGSize(width: width, height: 40)
    }
    
    //셀 가로 방향 스페이싱
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    //셀 세로 방향 스페이싱
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

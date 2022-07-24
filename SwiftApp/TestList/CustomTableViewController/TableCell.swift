//
//  TableCell.swift
//  SwiftApp
//
//  Created by jaeki lee on 2022/07/21.
//

import UIKit
import Then

class TableCell: UITableViewCell {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    func commonInit() {
        contentView.add(
            self.label,
            self.collectionView
        )
        updateConstraints()
    }
    
    override func updateConstraints() {
        self.label.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
        }
        
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.label.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        super.updateConstraints()
    }
    
    let list = [String](repeating: "Task_", count: 10)
    
    public let label = UILabel().then {
        $0.textAlignment = .center
    }
    
    public lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout().then {
            $0.minimumLineSpacing = 5
            $0.minimumInteritemSpacing = 5
        }
    ).then {
        $0.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionCell")
        $0.delegate = self
        $0.dataSource = self
        $0.isScrollEnabled = true
        $0.allowsMultipleSelection = true
        $0.allowsMultipleSelectionDuringEditing = true
    }
}

extension TableCell: UICollectionViewDataSource {
    //cell 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    //cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionViewCell
        cell.label.text =  "\(list[indexPath.item])\(indexPath.item)"
        return cell
    }
}

extension TableCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension TableCell: UICollectionViewDelegateFlowLayout {
    //collectionCell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/5, height: 50)
//        return CGSize(width: self.frame.width, height: 50)
    }
}

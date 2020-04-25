//
//  RecommendViewController.swift
//  DYZB
//
//  Created by 王 on R 2/04/24.
//  Copyright © Reiwa 2 王. All rights reserved.
//

import UIKit

private let kItemMargin: CGFloat = 10
private let kItemW = (kScreenW - 3 * kItemMargin) / 2
private let kItemH = kItemW * 3 / 4
private let kHeadViewH: CGFloat = 50

private let kNormalCellID = "kNormalCellID"
private let kHeaderViewID = "kHeaderViewID"

class RecommendViewController: UIViewController { //[unowned self] in
    
    // MARK:- 懒加载属性
    private lazy var collectionView: UICollectionView = {
        // 1.创建布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = kItemMargin
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeadViewH)
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        
        // 2.创建UICollectionView
        print(self.view.bounds)
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.blue
        collectionView.dataSource = self
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
         collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kNormalCellID)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        
        
        return collectionView
    }()

    // MARK:- 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        // 设置UI界面
        setupUI()
        
        

    }
    

  

}

// MARK:- 设置UI界面内容
extension RecommendViewController {
    private func setupUI() {
        // 1.将UICollectionView添加进控制器
        view.addSubview(collectionView)
    }
}

// MARK:- 遵守UICollectionView的数据源
extension RecommendViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 8
        }
        
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 1.获取cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath)
        
        cell.backgroundColor = UIColor.red
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // 1.取出section的HeaderView
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath)
        
        headerView.backgroundColor = UIColor.green
        
        return headerView
        
    }
}

//
//  YouTube_MenuBarView.swift
//  TrainingiOS
//
//  Created by 이병찬 on 2018. 7. 2..
//  Copyright © 2018년 Woolim. All rights reserved.
//

import UIKit

class YouTube_MenuBarView: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor(r: 230, g: 32, b: 31)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let cellId = "YOUTUBE_MENUBAR_CELLID"
    
    var horizontalBarConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
        
        collectionView.register(YouTube_MenuCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .top)
        addConstraintWithFormat("V:|[v0]|", views: collectionView)
        addConstraintWithFormat("H:|[v0]|", views: collectionView)
        
        setupHorizontalBar()
    }
    
    func setupHorizontalBar(){
        let horizontalView = UIView()
        horizontalView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalView)
        horizontalView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        horizontalBarConstraint =
        horizontalView.leftAnchor.constraint(equalTo: leftAnchor)
        horizontalBarConstraint?.isActive = true
        horizontalView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        horizontalView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/4).isActive = true
        horizontalView.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Use Storyboard Not Allowed")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    let barImageArr = [#imageLiteral(resourceName: "home"), #imageLiteral(resourceName: "trending"), #imageLiteral(resourceName: "subscriptions"), #imageLiteral(resourceName: "account")]
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! YouTube_MenuCell
        cell.imageView.image = barImageArr[indexPath.row].withRenderingMode(.alwaysTemplate)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}

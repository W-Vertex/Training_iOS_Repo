//
//  YouTube_MainVC.swift
//  TrainingiOS
//
//  Created by 이병찬 on 2018. 6. 30..
//  Copyright © 2018년 Woolim. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class YouTube_MainVC: UICollectionViewController {

    private let cellId = "YOUTUBE_CONTENT_CELL"
    
    private let disposeBag = DisposeBag()
    
    private var videoArr = [VideoModel](){
        didSet{ collectionView?.reloadData() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor(r: 230, g: 32, b: 31)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "HOME"
        titleLabel.textColor = .white
        
        navigationItem.titleView = titleLabel
        navigationController?.navigationBar.tintColor = .white
        
        let searchButton = UIBarButtonItem(image: #imageLiteral(resourceName: "search_icon").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(search))
        let moreButton = UIBarButtonItem(image: #imageLiteral(resourceName: "nav_more_icon").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(showMore))
        
        navigationItem.rightBarButtonItems = [moreButton, searchButton]
        
        setupMenuBar()
        setupCollectionView()
    }
    
    func setupCollectionView(){
        collectionView?.backgroundColor = .white
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
        }
        
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        
        collectionView?.isPagingEnabled = true
        
        collectionView?.rx.contentOffset.map{ $0.x }.map{ $0/4 }
            .subscribe(onNext: { [weak self] in
                self?.menuBar.horizontalBarConstraint?.constant = $0
            }).disposed(by: disposeBag)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Connector.instance.request(subPath: "/youtubeassets/home.json", method: "GET")
            .decodeData(decodeType: [VideoModel].self)
            .subscribe(onNext: { [weak self] _, data in
                guard let data = data else { return }
                self?.videoArr = data
            })
    }
    
    lazy var bottomSheet: YouTube_SettingBottomSheet = {
        let bottomSheet = YouTube_SettingBottomSheet()
        bottomSheet.rootViewController = self
        return bottomSheet
    }()
    
    @objc func showMore(){
        bottomSheet.show()
    }
    
    @objc func search(){
        
    }
    
    let menuBar: YouTube_MenuBarView = {
        let mb = YouTube_MenuBarView()
        mb.translatesAutoresizingMaskIntoConstraints = false
        return mb
    }()
    
    private func setupMenuBar(){
        let redView = UIView()
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.backgroundColor = UIColor(r: 230, g: 32, b: 31)
        view.addSubview(redView)
        
        view.addSubview(menuBar)
        navigationController?.hidesBarsOnSwipe = true
        
        view.addConstraintWithFormat("H:|[v0]|", views: redView)
        view.addConstraintWithFormat("V:|[v0(50)]", views: redView)
        
        view.addConstraintWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintWithFormat("V:[v0(50)]", views: menuBar)
        menuBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        menuBar.collectionView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.collectionView?.selectItem(at: indexPath, animated: true, scrollPosition: .left)
            }).disposed(by: disposeBag)
        
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        menuBar.collectionView.selectItem(at: IndexPath(row: Int(targetContentOffset.pointee.x / view.frame.width), section: 0), animated: true, scrollPosition: UICollectionViewScrollPosition.left)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = [.blue, .black, .yellow, .red][indexPath.row]
//        cell.video = videoArr[indexPath.row]
        return cell
    }

}

extension YouTube_MainVC: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let height = (view.frame.width - 32) / 16 * 9
//        return CGSize(width: view.frame.width, height: height + 16 + 68)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
}

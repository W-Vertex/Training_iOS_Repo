//
//  YouTube_SettingBottomSheet.swift
//  TrainingiOS
//
//  Created by 이병찬 on 2018. 7. 3..
//  Copyright © 2018년 Woolim. All rights reserved.
//

import UIKit

class YouTube_SettingBottomSheet: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    var rootViewController: UIViewController? = nil
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        return view
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private var windowView: UIView = {
        UIApplication.shared.keyWindow!
    }()
    
    private let cellId = "YOUTUBE_BOTTOMSHEET_CELL_ID"
    
    override init() {
        super.init()
        setBackViewFrame()
        setVisibleCollectionFrame()
        setTabGestureRecognizerForDismiss()
        
        collectionView.register(YouTube_SettingBottomSheetCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    private func setVisibleCollectionFrame(){
        let height = CGFloat(bottonSheetBarItemArr.count * 50)
        collectionView.frame = CGRect(x: 0, y: windowView.frame.height - height, width: windowView.frame.width, height: height)
    }
    
    private func setHideCollectionFrame(){
        let height = CGFloat(bottonSheetBarItemArr.count * 50)
        collectionView.frame = CGRect(x: 0, y: windowView.frame.height, width: windowView.frame.width, height: height)
    }
    
    private func setBackViewFrame(){
        backView.frame = windowView.frame
    }
    
    private func setTabGestureRecognizerForDismiss(){
        backView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dissmiss)))
    }
    
    func show(){
        backView.alpha = 0
        windowView.addSubview(backView)
        windowView.addSubview(collectionView)
        UIView.animate(withDuration: 0.5){ self.backView.alpha = 1 }
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.setVisibleCollectionFrame()
        })
    }
    
    @objc private func dissmiss(){
        UIView.animate(withDuration: 0.5, animations: { self.backView.alpha = 0 }){ _ in self.backView.removeFromSuperview() }
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.setHideCollectionFrame()
        }){ _ in self.collectionView.removeFromSuperview() }
    }
    
    private let bottonSheetBarItemArr = [(#imageLiteral(resourceName: "settings"), "Setting"), (#imageLiteral(resourceName: "privacy"), "Terms & Private Policy"), (#imageLiteral(resourceName: "feedback"), "Send Feedback"), (#imageLiteral(resourceName: "help"), "Help"), (#imageLiteral(resourceName: "switch_account"), "Switch Account"), (#imageLiteral(resourceName: "cancel"), "Cancel")]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bottonSheetBarItemArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        defer { dissmiss() }
        
        let data = bottonSheetBarItemArr[indexPath.row]
        guard data.1 != "Cancel" else { return }
        
        let vc = UIViewController()
        vc.navigationItem.title = data.1
        vc.view.backgroundColor = .white
        rootViewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! YouTube_SettingBottomSheetCell
        cell.iconImageView.image = bottonSheetBarItemArr[indexPath.row].0
        cell.titleLabel.text = bottonSheetBarItemArr[indexPath.row].1
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

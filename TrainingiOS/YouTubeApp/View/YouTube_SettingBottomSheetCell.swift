//
//  YouTube_SettingBottomSheetCell.swift
//  TrainingiOS
//
//  Created by 이병찬 on 2018. 7. 3..
//  Copyright © 2018년 Woolim. All rights reserved.
//

import UIKit

class YouTube_SettingBottomSheetCell: UICollectionViewCell {
    
    override var isHighlighted: Bool{
        didSet{
            backgroundColor = isHighlighted ? .lightGray : .white
            titleLabel.textColor = isHighlighted ? .white : .black
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Use Storyboard Not Allowed")
    }
    
    func setupViews(){
        addSubview(titleLabel)
        addSubview(iconImageView)
        addConstraintWithFormat("H:|-16-[v0(30)]-16-[v1]-16-|", views: iconImageView, titleLabel)
        addConstraintWithFormat("V:|-8-[v0]-8-|", views: titleLabel)
        addConstraintWithFormat("V:[v0(30)]", views: iconImageView)
        addConstraint(NSLayoutConstraint(item: iconImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
}

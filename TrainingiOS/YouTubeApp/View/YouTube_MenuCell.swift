//
//  YouTube_MenuCell.swift
//  TrainingiOS
//
//  Created by 이병찬 on 2018. 7. 2..
//  Copyright © 2018년 Woolim. All rights reserved.
//

import UIKit

class YouTube_MenuCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = UIColor(r: 91, g: 14, b: 13)
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Using Storyboard Not Allowed")
    }
    
    override var isSelected: Bool{
        didSet{
            imageView.tintColor = isSelected ? .white : UIColor(r: 91, g: 14, b: 13)
        }
    }
    
    func setupView(){
        addSubview(imageView)
        addConstraintWithFormat("V:[v0(28)]", views: imageView)
        addConstraintWithFormat("H:[v0(28)]", views: imageView)
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0 ))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0 ))
    }

}

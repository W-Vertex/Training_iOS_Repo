//
//  FacebookLoading_MainView.swift
//  TrainingiOS
//
//  Created by 이병찬 on 2018. 7. 6..
//  Copyright © 2018년 Woolim. All rights reserved.
//

import UIKit

class FacebookLoading_MainView: UIView {

    required init?(coder aDecoder: NSCoder) {
        fatalError("ERROR")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    var contentViewColor: UIColor = .lightGray{
        didSet{
            userProfileImageView.backgroundColor = contentViewColor
            titleLabel.backgroundColor = contentViewColor
            subTitleLabel.backgroundColor = contentViewColor
            contentView.backgroundColor = contentViewColor
        }
    }
    
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 22
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .lightGray
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .lightGray
        return label
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    
    func setupView(){
        [userProfileImageView, titleLabel, subTitleLabel, contentView].forEach{ addSubview($0) }
        addConstraintWithFormat("H:|-16-[v0(44)]-16-[v1]-32-|", views: userProfileImageView, titleLabel)
        subTitleLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        subTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -82).isActive = true
        addConstraintWithFormat("H:|-16-[v0]-16-|", views: contentView)
        addConstraintWithFormat("V:|-16-[v0(18)]-8-[v1(18)]-16-[v2]-16-|", views: titleLabel, subTitleLabel, contentView)
        addConstraintWithFormat("V:|-16-[v0(44)]", views: userProfileImageView)
    }

}

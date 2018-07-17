//
//  YouTube_MainVideoContentCell.swift
//  TrainingiOS
//
//  Created by 이병찬 on 2018. 6. 30..
//  Copyright © 2018년 Woolim. All rights reserved.
//

import UIKit
import Kingfisher

class YouTube_MainVideoContentCell: UICollectionViewCell {
    
    var video: VideoModel?{
        didSet{
            guard let video = video else { return }
            thumnailImageView.kf.setImage(with: URL(string: video.thumbnail_image_name)!)
            titleLabel.text = video.title
            subTitleTextView.text = "\(video.channel.name) * \(video.number_of_views)Views"
            userProfileImageView.kf.setImage(with: URL(string: video.channel.profile_image_name)!)
        }
    }

    let thumnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 22
        return imageView
    }()
    
    let separateView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This is Title"
        return label
    }()
    
    let subTitleTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = .lightGray
        textView.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        textView.text = "The First Video SubTitleText 입니다. 좋은 시청 바랍니다. 뒤에 붙이는 텍스트는 TextView의 글이 넘어가게 하기 위해 쓰는 겁니다."
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView(){
        self.addSubview(thumnailImageView)
        self.addSubview(separateView)
        self.addSubview(userProfileImageView)
        self.addSubview(titleLabel)
        self.addSubview(subTitleTextView)
        
        addConstraintWithFormat("V:|-16-[v0]-8-[v1(44)]-16-[v2(0.5)]|", views: thumnailImageView, userProfileImageView, separateView)
        addConstraintWithFormat("H:|-16-[v0]-16-|", views: thumnailImageView)
        addConstraintWithFormat("H:|[v0]|", views: separateView)
        addConstraintWithFormat("H:|-16-[v0(44)]", views: userProfileImageView)
        
        addConstraintWithFormat("H:[v0]-8-[v1]-16-|", views: userProfileImageView, titleLabel)
        addConstraintWithFormat("H:[v0]-8-[v1]-16-|", views: userProfileImageView, subTitleTextView)
        addConstraintWithFormat("V:[v0]-8-[v1(18)]", views: thumnailImageView, titleLabel)
        addConstraintWithFormat("V:[v0]-4-[v1(30)]", views: titleLabel, subTitleTextView)
        
//        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 8))
//        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
//        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute: .right, relatedBy: .equal, toItem: thumnailImageView, attribute: .right, multiplier: 1, constant: 0))
//        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 18))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Use Storyboard Not Allowed")
    }

}

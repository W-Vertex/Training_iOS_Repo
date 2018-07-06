//
//  File.swift
//  TrainingiOS
//
//  Created by 이병찬 on 2018. 7. 6..
//  Copyright © 2018년 Woolim. All rights reserved.
//

import UIKit

class SkeletonAnimation{
    
    let view: UIView
    
    init(view: UIView) {
        self.view = view
    }
    
    func start(){
        let layerWidth = view.frame.width, layerHeight = view.frame.height
        
        let sideColor = UIColor(white: 1, alpha: 0.0)
        let centerColor = UIColor(white: 1, alpha: 0.8)
        
        let gradiantLayer = CAGradientLayer()
        gradiantLayer.colors = [sideColor.cgColor, centerColor.cgColor, sideColor.cgColor]
        gradiantLayer.locations = [0, 0.5, 1]
        
        let gradiantFrame = CGRect(x: 0, y: 0, width: layerHeight, height: layerWidth)
        gradiantLayer.frame = gradiantFrame
        
        let angle = 90 * CGFloat.pi / 180
        gradiantLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
        gradiantLayer.position = CGPoint(x: layerWidth / 2, y: layerHeight / 2)
        
        view.layer.mask = gradiantLayer
        
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = 0.5
        animation.fromValue = -view.frame.width
        animation.toValue = view.frame.width
        animation.repeatCount = Float.infinity
        
        gradiantLayer.add(animation, forKey: "loading_animation")
    }
    
    func stop(){
        view.layer.removeAnimation(forKey: "loading_animation")
        view.layer.mask = nil
    }
    
}

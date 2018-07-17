//
//  CircleLoading_MainView.swift
//  TrainingiOS
//
//  Created by 이병찬 on 2018. 7. 10..
//  Copyright © 2018년 Woolim. All rights reserved.
//

import UIKit

class CircleLoading_MainView: UIView {

    required init?(coder aDecoder: NSCoder) {
        fatalError("Use Storyboard Not Allow")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    let circleLayer = CAShapeLayer()
    
    private func setView(){
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: CGFloat.pi * 2, clockwise: true)
        circleLayer.path = circularPath.cgPath
        
        circleLayer.strokeColor = UIColor.red.cgColor
        circleLayer.lineWidth = 10
        circleLayer.strokeEnd = 0
        circleLayer.lineCap = kCALineCapRound
        
        self.layer.addSublayer(circleLayer)
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(startAnimation)))
    }
    
    @objc func startAnimation(){
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        animation.toValue = 1
        animation.duration = 2
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
        circleLayer.add(animation, forKey: "animation")
    
    }

}

//
//  Extensions.swift
//  TrainingiOS
//
//  Created by 이병찬 on 2018. 7. 2..
//  Copyright © 2018년 Woolim. All rights reserved.
//

import UIKit

extension UIView{
    
    func addConstraintWithFormat(_ format: String, views: UIView...){
        var viewsDic = [String : UIView]()
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            viewsDic[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDic))
    }
    
}

extension UIColor{
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
}

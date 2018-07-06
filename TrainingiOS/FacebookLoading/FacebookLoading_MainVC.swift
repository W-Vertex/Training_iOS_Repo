//
//  FacebookLoading_MainVC.swift
//  TrainingiOS
//
//  Created by 이병찬 on 2018. 7. 6..
//  Copyright © 2018년 Woolim. All rights reserved.
//

import UIKit

class FacebookLoading_MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    func setUpView(){
        let loadView = FacebookLoading_MainView(frame: CGRect(x: 0, y: 128, width: view.frame.width, height: 320))
        loadView.contentViewColor = .darkGray
        let backView = FacebookLoading_MainView(frame: CGRect(x: 0, y: 128, width: view.frame.width, height: 320))
        backView.contentViewColor = .lightGray
        view.addSubview(backView)
        view.addSubview(loadView)
        let skeleton = SkeletonAnimation(view: loadView)
        skeleton.start()
        DispatchQueue.main.async {
            sleep(3)
            skeleton.stop()
        }
    }

}

//
//  CircleLoading_MainVC.swift
//  TrainingiOS
//
//  Created by 이병찬 on 2018. 7. 10..
//  Copyright © 2018년 Woolim. All rights reserved.
//

import UIKit

class CircleLoading_MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let loadingView = CircleLoading_MainView(frame: view.frame)
        loadingView.center = view.center
        view.addSubview(loadingView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

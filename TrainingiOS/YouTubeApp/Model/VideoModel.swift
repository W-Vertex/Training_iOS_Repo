//
//  VideoModel.swift
//  TrainingiOS
//
//  Created by 이병찬 on 2018. 7. 3..
//  Copyright © 2018년 Woolim. All rights reserved.
//

import UIKit

struct VideoModel: Codable{
    
    let title: String
    let thumbnail_image_name: String
    let number_of_views: Int

    let channel: ChannelModel
    
}

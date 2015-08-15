//
//  HGSideCellModel.swift
//  HGRunning
//
//  Created by 任是无情也动人 on 15/8/15.
//  Copyright (c) 2015年 ismyway. All rights reserved.
//

import UIKit


@objc
class HGSideCellModel {
    
    let title: String
    let creator: String
    let image: UIImage?
    
    init(title: String, creator: String, image: UIImage?) {
        self.title = title
        self.creator = creator
        self.image = image
    }
    
    class func allCatsdd() -> Array<HGSideCellModel> {
        return [
            HGSideCellModel(title: "Sleeping Cat", creator: "papaija2008", image: UIImage(named: "ID-100113060.jpg"))
        ]
    }
    
}

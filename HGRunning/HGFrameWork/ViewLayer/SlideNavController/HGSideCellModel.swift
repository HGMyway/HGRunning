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
    let image: UIImage?
    let DNAstr : String
    
    
    init(title: String, DNAstr:String, image: UIImage?) {
        self.title = title
        self.image = image
        self.DNAstr = DNAstr
    }
    
    
    class func  allCellData() ->Array<HGSideCellModel>
    {
        return [
            HGSideCellModel(title: "Home",DNAstr : "HGHomeViewController",image: UIImage(named: "ID-100113060")),
            HGSideCellModel(title: "Setting",DNAstr : "HGMainCenterViewController", image: UIImage(named: "ID-10022760"))
        ]
    
    }
    
//    class func allCats() -> Array<HGSideCellModel> {
//        return [ HGSideCellModel(title: "Sleeping Cat", creator: "papaija2008", image: UIImage(named: "ID-100113060.jpg")),
//            HGSideCellModel(title: "Pussy Cat", creator: "Carlos Porto", image: UIImage(named: "ID-10022760.jpg")),
//            HGSideCellModel(title: "Korat Domestic Cat", creator: "sippakorn", image: UIImage(named: "ID-10091065.jpg")),
//            HGSideCellModel(title: "Tabby Cat", creator: "dan", image: UIImage(named: "ID-10047796.jpg")),
//            HGSideCellModel(title: "Yawning Cat", creator: "dan", image: UIImage(named: "ID-10092572.jpg")),
//            HGSideCellModel(title: "Tabby Cat", creator: "dan", image: UIImage(named: "ID-10041194.jpg")),
//            HGSideCellModel(title: "Cat On The Rocks", creator: "Willem Siers", image: UIImage(named: "ID-10017782.jpg")),
//            HGSideCellModel(title: "Brown Cat Standing", creator: "aopsan", image: UIImage(named: "ID-10091745.jpg")),
//            HGSideCellModel(title: "Burmese Cat", creator: "Rosemary Ratcliff", image: UIImage(named: "ID-10056941.jpg")),
//            HGSideCellModel(title: "Cat", creator: "dan", image: UIImage(named: "ID-10019208.jpg")),
//            HGSideCellModel(title: "Cat", creator: "graur codrin", image: UIImage(named: "ID-10011404.jpg")) ]
//    }
//    
//    class func allDogs() -> Array<HGSideCellModel> {
//        return [ HGSideCellModel(title: "White Dog Portrait", creator: "photostock", image: UIImage(named: "ID-10034505.jpg")),
//            HGSideCellModel(title: "Black Labrador Retriever", creator: "Michal Marcol", image: UIImage(named: "ID-1009881.jpg")),
//            HGSideCellModel(title: "Anxious Dog", creator: "James Barker", image: UIImage(named: "ID-100120.jpg")),
//            HGSideCellModel(title: "Husky Dog", creator: "James Barker", image: UIImage(named: "ID-100136.jpg")),
//            HGSideCellModel(title: "Puppy", creator: "James Barker", image: UIImage(named: "ID-100140.jpg")),
//            HGSideCellModel(title: "Black Labrador Puppy", creator: "James Barker", image: UIImage(named: "ID-10018395.jpg")),
//            HGSideCellModel(title: "Yellow Labrador", creator: "m_bartosch", image: UIImage(named: "ID-10016005.jpg")),
//            HGSideCellModel(title: "Black Labrador", creator: "Felixco, Inc.", image: UIImage(named: "ID-10012923.jpg")),
//            HGSideCellModel(title: "Sleepy Dog", creator: "Maggie Smith", image: UIImage(named: "ID-10021769.jpg")),
//            HGSideCellModel(title: "English Springer Spaniel Puppy", creator: "Tina Phillips", image: UIImage(named: "ID-10056667.jpg")),
//            HGSideCellModel(title: "Intelligent Dog", creator: "James Barker", image: UIImage(named: "ID-100137.jpg")) ]
//    }
}

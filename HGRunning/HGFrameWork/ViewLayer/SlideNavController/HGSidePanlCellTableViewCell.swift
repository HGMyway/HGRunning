//
//  HGSidePanlCellTableViewCell.swift
//  HGRunning
//
//  Created by 任是无情也动人 on 15/8/15.
//  Copyright (c) 2015年 ismyway. All rights reserved.
//

import UIKit

class HGSidePanlCellTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func  configureForSidePannalCell(cellModel:HGSideCellModel){
        
    titleLabel.text = cellModel.title
        
    
        
    }

}

//
//  HGSidePanelViewController.swift
//  HGRunning
//
//  Created by 任是无情也动人 on 15/8/15.
//  Copyright (c) 2015年 ismyway. All rights reserved.
//

import UIKit

@objc
protocol HGSidePanelViewControllerDelegate {
    //  func animalSelected(animal: Animal)
    
    func panelCellClick(selectedModel : HGSideCellModel)
    
}

class HGSidePanelViewController: HGBaseViewController {
    
    var delegete :HGSidePanelViewControllerDelegate?
    
    var sideCellList: Array<HGSideCellModel>!
    
    struct TableView {
        struct CellIdentifiers {
            static let AnimalCell = "HGAnimalCell"
            static let  HGSidePanlCellTableViewCell = "HGSidePanlCellTableViewCell"
        }
    }

   
}



// MARK: Table View Data Source

extension HGSidePanelViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sideCellList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCellWithIdentifier(TableView.CellIdentifiers.AnimalCell, forIndexPath: indexPath) as! HGAnimalCell
//        cell.configureForAnimal(animals[indexPath.row])
        let cell = tableView.dequeueReusableCellWithIdentifier(TableView.CellIdentifiers.HGSidePanlCellTableViewCell) as! HGSidePanlCellTableViewCell
        
        cell.configureForSidePannalCell(sideCellList[indexPath.row])
        
        return cell
    }
    
}

// Mark: Table View Delegate
extension HGSidePanelViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //     let selectedAnimal = animals[indexPath.row]
        //    delegete?.animalSelected(selectedAnimal)
        
        let selectedModel  =  sideCellList[indexPath.row]
        delegete?.panelCellClick(selectedModel)
        
        
    }
    
}





//class HGAnimalCell: UITableViewCell {
//    
//    @IBOutlet weak var animalImageView: UIImageView!
//    @IBOutlet weak var imageNameLabel: UILabel!
//    @IBOutlet weak var imageCreatorLabel: UILabel!
//    
//    
//    
//    
//    func configureForAnimal(animal: Animal) {
//        animalImageView.image = animal.image
//        imageNameLabel.text = animal.title
//        imageCreatorLabel.text = animal.creator
//    }
//    
//}



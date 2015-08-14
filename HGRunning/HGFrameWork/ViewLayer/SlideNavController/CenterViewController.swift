//
//  CenterViewController.swift
//  HGRunning
//
//  Created by 任是无情也动人 on 15/8/12.
//  Copyright (c) 2015年 ismyway. All rights reserved.
//

import UIKit


@objc
protocol CenterViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func toggleRightPanel()
    optional func collapseSidePanels()
}


class CenterViewController: HGBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        
//        testViewController = UIStoryboard.testViewController()
//    
//        view.addSubview(testViewController.view)
//        
//        addChildViewController(testViewController)
//        testViewController.didMoveToParentViewController(self)
//        
        
    }
    
    var testViewController:TestViewController!

    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var creatorLabel: UILabel!
    
    var delegate: CenterViewControllerDelegate?
    
    // MARK: Button actions
    
    @IBAction func kittiesTapped(sender: AnyObject) {
     
        delegate?.toggleLeftPanel?()
        
        
    }
    
    @IBAction func puppiesTapped(sender: AnyObject) {
        delegate?.toggleRightPanel?()
    }
}


extension CenterViewController: SidePanelViewControllerDelegate {
    func animalSelected(animal: Animal) {
        imageView.image = animal.image
        titleLabel.text = animal.title
        creatorLabel.text = animal.creator
        
        delegate?.collapseSidePanels?()
        
//                testViewController = UIStoryboard.testViewController()
//        
//                view.addSubview(testViewController.view)
//        
//                addChildViewController(testViewController)
//                testViewController.didMoveToParentViewController(self)
        
    }
}



private extension UIStoryboard {
    class func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()) }
    
    
    class func testViewController() -> TestViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("TestViewController") as? TestViewController
    }

}


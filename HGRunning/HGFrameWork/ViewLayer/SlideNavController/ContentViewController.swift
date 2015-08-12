//
//  ContentViewController.swift
//  HGRunning
//
//  Created by 任是无情也动人 on 15/8/12.
//  Copyright (c) 2015年 ismyway. All rights reserved.
//

import UIKit

//import QuartzCore

class ContentViewController: HGBaseViewController,CenterViewControllerDelegate
{

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.whiteColor()
        
        
        centerViewController = UIStoryboard.centerViewController()
        centerViewController.delegate = self;
        
        centerNavigationController = UINavigationController(rootViewController: centerViewController)
        view.addSubview(centerNavigationController.view)
        
        addChildViewController(centerNavigationController)
        
        centerNavigationController.didMoveToParentViewController(self)
        
    }
    
    var centerNavigationController: UINavigationController!
    var centerViewController: CenterViewController!
    

   
}



private extension UIStoryboard {
    class func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()) }
    
    class func leftViewController() -> SidePanelViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("LeftViewController") as? SidePanelViewController
    }
    
    class func rightViewController() -> SidePanelViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("RightViewController") as? SidePanelViewController
    }
    
    class func centerViewController() -> CenterViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("CenterViewController") as? CenterViewController
    }
    
}
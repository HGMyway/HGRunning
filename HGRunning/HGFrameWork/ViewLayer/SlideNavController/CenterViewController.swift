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
    optional func leftSlideBtnClick()
    optional func rightSlideBtnClick()
    optional func collapseSidePanels()
}


class CenterViewController: HGBaseViewController
{
    
    
    var delegate: CenterViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addHomeViewController()
    }
    
    
    
    var currentChildVC:UIViewController?
    
    //MARK: childVC
    var homeViewController:HGHomeViewController!
    var mineCenterViewController:HGMineCenterViewController!{
        get{
            return UIStoryboard.mineCenterViewController()
        }
    }
    
    
    private func addHomeViewController(){
        homeViewController = UIStoryboard.homeViewController()
        view.addSubview(homeViewController.view)
        addChildViewController(homeViewController)
        homeViewController.didMoveToParentViewController(self)
        currentChildVC = homeViewController
    }
    
    private func replaceController(newVc:UIViewController){
        if currentChildVC != newVc{
            addChildViewController(newVc)
            transitionFromViewController(currentChildVC!, toViewController: newVc, duration: 1.0, options: UIViewAnimationOptions.TransitionNone, animations: nil, completion: {(finished) -> Void in
                self.currentChildVC!.removeFromParentViewController()
                newVc.didMoveToParentViewController(self)
                self.currentChildVC = newVc
                
            })
        }
    }
    
    
    // MARK: rootvc中左右导航栏按钮
    @IBAction func leftSlideBtnClick(sender: AnyObject) {
        delegate?.leftSlideBtnClick?()
    }
    
    //    @IBAction func rightSlideBtnClick(sender: AnyObject) {
    //        delegate?.rightSlideBtnClick?()
    //    }
}




// MARK: rootvc中左右导航栏按钮事件
extension CenterViewController: SidePanelViewControllerDelegate {
    
    func panelCellClick() {
        delegate?.collapseSidePanels?()
        
        replaceController(mineCenterViewController)
        
    }
    
    //    func animalSelected(animal: Animal) {
    //        imageView.image = animal.image
    //        titleLabel.text = animal.title
    //        creatorLabel.text = animal.creator
    //
    //        delegate?.collapseSidePanels?()
    //
    ////                testViewController = UIStoryboard.testViewController()
    ////
    ////                view.addSubview(testViewController.view)
    ////
    ////                addChildViewController(testViewController)
    ////                testViewController.didMoveToParentViewController(self)
    //
    //    }
}



//MARK: 获取SB中rootvc
private extension UIStoryboard {
    class func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()) }
    
    
    class func homeViewController() -> HGHomeViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("HGHomeViewController") as? HGHomeViewController
    }
    
    class func mineCenterViewController() -> HGMineCenterViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("HGMineCenterViewController") as? HGMineCenterViewController
    }
    
}


//
//  HGContentViewController.swift
//  HGRunning
//
//  Created by 任是无情也动人 on 15/8/15.
//  Copyright (c) 2015年 ismyway. All rights reserved.
//

import UIKit



enum HGSlideOutState {
    case BothCollapsed
    case LeftPanelExpanded
    case RightPanelExpanded
}


class HGContentViewController: HGBaseViewController{
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        centerViewController = UIStoryboard.centerViewController()
        centerViewController.delegate = self;
        
        centerNavigationController = UINavigationController(rootViewController: centerViewController)
        view.addSubview(centerNavigationController.view)
        
        addChildViewController(centerNavigationController)
        
        centerNavigationController.didMoveToParentViewController(self)
        
        //        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "handlePanGesture:")
        //        centerNavigationController.view.addGestureRecognizer(panGestureRecognizer)
        
        
        
        
    }
    
    var currentState: HGSlideOutState = .BothCollapsed{
        didSet{
            let shouldShowShadow = currentState != .BothCollapsed
            showShadowForCenterViewController(shouldShowShadow)
        }
    }
    var leftViewController: HGSidePanelViewController?
    
    var centerNavigationController: UINavigationController!
    var centerViewController: HGMainCenterViewController!
    
    let centerPanelExpandedOffset: CGFloat = 60
    
    
    
    var rightViewController: HGSidePanelViewController?
    
    
}



private extension UIStoryboard {
    class func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()) }
    
    class func leftViewController() -> HGSidePanelViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("LeftViewController") as? HGSidePanelViewController
    }
    
    class func rightViewController() -> HGSidePanelViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("RightViewController") as? HGSidePanelViewController
    }
    
    class func centerViewController() -> HGMainCenterViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("HGMainCenterViewController") as? HGMainCenterViewController
    }
    
}


//MARK: 手势
extension HGContentViewController: UIGestureRecognizerDelegate {
    // MARK: Gesture recognizer
    
    func handlePanGesture(recognizer: UIPanGestureRecognizer) {
        let gestureIsDraggingFromLeftToRight = (recognizer.velocityInView(view).x > 0)
        
        switch(recognizer.state) {
        case .Began:
            if (currentState == .BothCollapsed) {
                if (gestureIsDraggingFromLeftToRight) {
                    addLeftPanelViewController()
                } else {
                    addRightPanelViewController()
                }
                
                showShadowForCenterViewController(true)
            }
        case .Changed:
            recognizer.view!.center.x = recognizer.view!.center.x + recognizer.translationInView(view).x
            recognizer.setTranslation(CGPointZero, inView: view)
        case .Ended:
            if (leftViewController != nil) {
                // animate the side panel open or closed based on whether the view has moved more or less than halfway
                let hasMovedGreaterThanHalfway = recognizer.view!.center.x > view.bounds.size.width
                leftSidePanel(shouldExpand: hasMovedGreaterThanHalfway)
            } else if (rightViewController != nil) {
                let hasMovedGreaterThanHalfway = recognizer.view!.center.x < 0
                animateRightPanel(shouldExpand: hasMovedGreaterThanHalfway)
            }
        default:
            break
        }
    }
    
}


// MARK: CenterViewController delegate
extension HGContentViewController: HGMainCenterViewControllerDelegate {
    
    func collapseSidePanels() {
        switch (currentState) {
        case .RightPanelExpanded:
            rightSlideBtnClick()
        case .LeftPanelExpanded:
            leftSlideBtnClick()
        default:
            break
        }
    }
    
    
    func leftSlideBtnClick() {
        let notAlreadyExpanded = (currentState != .LeftPanelExpanded)
        if notAlreadyExpanded{
            addLeftPanelViewController()
        }
        leftSidePanel(shouldExpand: notAlreadyExpanded)
        
    }
    
    func rightSlideBtnClick() {
        let notAlreadyExpanded = (currentState != .RightPanelExpanded)
        
        if notAlreadyExpanded {
            addRightPanelViewController()
        }
        
        animateRightPanel(shouldExpand: notAlreadyExpanded)
        
    }
    
    func addLeftPanelViewController() {
        if(leftViewController == nil){
            leftViewController = UIStoryboard.leftViewController()
            leftViewController!.sideCellList = HGSideCellModel.allCellData()
            
            addChildSidePanelController(leftViewController!)
            
            
        }
    }
    
    
    
    
    
    
    func leftSidePanel(#shouldExpand: Bool) {
        
        if (shouldExpand) {
            currentState = .LeftPanelExpanded
            
            animateCenterPanelXPosition(targetPosition: CGRectGetWidth(centerNavigationController.view.frame) - centerPanelExpandedOffset)
        } else {
            animateCenterPanelXPosition(targetPosition: 0) { finished in
                self.currentState = .BothCollapsed
                
                self.leftViewController?.view.removeFromSuperview()
                self.leftViewController = nil;
            }
        }
        
        
    }
    
    
    
    func addRightPanelViewController() {
        if (rightViewController == nil) {
            rightViewController = UIStoryboard.rightViewController()
            rightViewController!.sideCellList = HGSideCellModel.allCellData()
            
            addChildSidePanelController(rightViewController!)
        }
        
    }
    
    func animateRightPanel(#shouldExpand: Bool) {
        if (shouldExpand) {
            currentState = .RightPanelExpanded
            
            animateCenterPanelXPosition(targetPosition: -CGRectGetWidth(centerNavigationController.view.frame) + centerPanelExpandedOffset)
        } else {
            animateCenterPanelXPosition(targetPosition: 0) { _ in
                self.currentState = .BothCollapsed
                
                self.rightViewController?.view.removeFromSuperview()
                self.rightViewController = nil;
            }
        }
    }
    
    
    func addChildSidePanelController(sidePanelController: HGSidePanelViewController) {
        sidePanelController.delegete = centerViewController
        
        view.insertSubview(sidePanelController.view, atIndex: 0)
        addChildViewController(sidePanelController)
        sidePanelController.didMoveToParentViewController(self)
        
    }
    
    func animateCenterPanelXPosition(#targetPosition: CGFloat, completion: ((Bool) -> Void)! = nil) {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: {
            self.centerNavigationController.view.frame.origin.x = targetPosition
            }, completion: completion)
    }
    
    
    
    
    func showShadowForCenterViewController(shouldShowShadow: Bool) {
        if (shouldShowShadow) {
            centerNavigationController.view.layer.shadowOpacity = 0.8
        } else {
            centerNavigationController.view.layer.shadowOpacity = 0.0
        }
    }
    
}
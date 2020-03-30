//
//  ExampleTransitioningDelegate.swift
//  TestMonthYearPicker
//
//  Created by Kavisha on 30/03/20.
//  Copyright © 2020 Kavisha. All rights reserved.
//

import UIKit

class ExampleTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController!, sourceViewController source: UIViewController) -> UIPresentationController? {
        let presentationController = ExamplePresentationController(presentedViewController:presented, presenting:presenting)
        return presentationController
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animationController = ExampleAnimatedTransitioning()
        animationController.isPresentation = true
        return animationController
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animationController = ExampleAnimatedTransitioning()
        animationController.isPresentation = false
        return animationController
    }
}

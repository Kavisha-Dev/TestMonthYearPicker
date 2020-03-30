//
//  ExamplePresentationController.swift
//  TestMonthYearPicker
//
//  Created by Kavisha on 30/03/20.
//  Copyright © 2020 Kavisha. All rights reserved.
//

import UIKit

class ExamplePresentationController: UIPresentationController, UIAdaptivePresentationControllerDelegate{
    
    override var frameOfPresentedViewInContainerView: CGRect {
        get {
            print("ExamplePresentationController")
            guard let theView = containerView else {
                return CGRect.zero
            }
            let height = theView.bounds.height/3
            let y = theView.bounds.height - height
            //return CGRect(x: 10 , y: y, width: theView.bounds.width - 20, height: height)
            print(height)
            return CGRect(x: 0 , y: y, width: theView.bounds.width, height: height)
        }
    }
    
    var chromeView: UIView = UIView()
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController!) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        
        chromeView.backgroundColor = UIColor(white:0.0, alpha:0.4)
        chromeView.alpha = 0.0
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(chromeViewTapped(_:)))
        chromeView.addGestureRecognizer(tap)
    }
    
    @objc func chromeViewTapped(_ gesture: UIGestureRecognizer) {
        if (gesture.state == UIGestureRecognizer.State.ended) {
            presentingViewController.dismiss(animated: true, completion: nil)
        }
    }
    
    override func presentationTransitionWillBegin() {
        if let containerView = self.containerView {
            chromeView.frame = containerView.bounds
            chromeView.alpha = 0.0
            containerView.insertSubview(chromeView, at:0)
            
            let coordinator = presentedViewController.transitionCoordinator
            if (coordinator != nil) {
                coordinator!.animate(alongsideTransition: {
                    (context:UIViewControllerTransitionCoordinatorContext!) -> Void in
                    self.chromeView.alpha = 1.0
                }, completion:nil)
            } else {
                chromeView.alpha = 1.0
            }
        }
    }
    
    
    override func dismissalTransitionWillBegin() {
        let coordinator = presentedViewController.transitionCoordinator
        if (coordinator != nil) {
            coordinator!.animate(alongsideTransition: {
                (context:UIViewControllerTransitionCoordinatorContext!) -> Void in
                self.chromeView.alpha = 0.0
            }, completion:nil)
        } else {
            chromeView.alpha = 0.0
        }
    }
    
    
}

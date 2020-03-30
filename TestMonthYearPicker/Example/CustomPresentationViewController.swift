//
//  CustomPresentationViewController.swift
//  TestMonthYearPicker
//
//  Created by Kavisha on 30/03/20.
//  Copyright © 2020 Kavisha. All rights reserved.
//

import UIKit

class CustomPresentationViewController: UIViewController {
    
    let exampleTransitionDelegate = ExampleTransitioningDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showPickerButtonTapped(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pvc = storyboard.instantiateViewController(withIdentifier: "PickerViewControllerId") as UIViewController as! PickerViewController
        
        //let pvc = PickerViewController()
        pvc.modalPresentationStyle = UIModalPresentationStyle.custom
        pvc.transitioningDelegate = self
        pvc.chosenMonthIndex = 2
        pvc.chosenYearIndex = 3
        
        pvc.delegate = self
        
        self.present(pvc, animated: true, completion: nil)
        
    }
    
}

extension CustomPresentationViewController: PickerViewControllerDoneDelegate {
    
    func onUserClickingDone(with index: UserSelectedIndex) {
        print("User selected month index : \(index.monthIndex), year index : \(index.yearIndex)")
    }
    
    
    
}

extension CustomPresentationViewController: UIViewControllerTransitioningDelegate {
    
    /*func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController!, sourceViewController source: UIViewController) -> UIPresentationController? {
        let presentationController = ExamplePresentationController(presentedViewController:presented, presenting:presenting)
        return presentationController
    }*/
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return ExamplePresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    /*func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animationController = ExampleAnimatedTransitioning()
        animationController.isPresentation = true
        return animationController
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animationController = ExampleAnimatedTransitioning()
        animationController.isPresentation = false
        return animationController
    }*/
    
    
}



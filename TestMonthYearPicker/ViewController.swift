//
//  ViewController.swift
//  TestMonthYearPicker
//
//  Created by Kavisha on 30/03/20.
//  Copyright © 2020 Kavisha. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIViewControllerTransitioningDelegate {
    
    let exampleTransitionDelegate = ExampleTransitioningDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func onShowPickerClicked(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pvc = storyboard.instantiateViewController(withIdentifier: "MonthYearViewController") as UIViewController
        
        pvc.modalPresentationStyle = UIModalPresentationStyle.custom
        pvc.transitioningDelegate = self
        
        self.present(pvc, animated: true, completion: nil)
        
        
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return MonthYearViewController(presentedViewController: presented, presenting: presenting)
    }
    
    
}

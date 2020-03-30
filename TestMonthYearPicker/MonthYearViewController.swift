//
//  MonthYearViewController.swift
//  TestMonthYearPicker
//
//  Created by Kavisha on 30/03/20.
//  Copyright © 2020 Kavisha. All rights reserved.
//

import UIKit

class MonthYearViewController : UIPresentationController, UIAdaptivePresentationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    override var frameOfPresentedViewInContainerView: CGRect {
        get {
            print("MonthYearViewController")
            guard let theView = containerView else {
                return CGRect.zero
            }
            return CGRect(x: 10 , y: theView.bounds.height/2, width: theView.bounds.width - 20, height: theView.bounds.height/4)
        }
    }
    
    var tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer()
    
    @objc func dismiss(){
        self.presentedViewController.dismiss(animated: true, completion: nil)
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
    
    var customMonth = "Custom"
    var customYearData = "All Notes"
    
    var months  = [String]()
    var years   = [String]()
    
    var selectedMonth = ""
    var selectedYear = ""
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch (component) {
        case 0: return months.count
        case 1: return years.count
            
        default:break;
        }
        return 0;
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("didSelectRow CALLED")
        
        print(String(format: "Row %li selected in component %li", row, component))
        switch component {
        case 0:
            selectedMonth = months[row]
            if selectedMonth == customMonth {
                pickerView.selectRow(2, inComponent: 1, animated: true)
                
            }else {
                let component2SelectedRow = pickerView.selectedRow(inComponent: 1)
                if component2SelectedRow == 2 {
                    pickerView.selectRow(1, inComponent: 1, animated: true)
                }
            }
            return
            
        case 1:
            selectedYear = years[row]
            if selectedYear == customYearData {
                pickerView.selectRow(12, inComponent: 0, animated: true)
            }
            else {
                let component1SelectedRow = pickerView.selectedRow(inComponent: 0)
                if component1SelectedRow == 12 {
                    pickerView.selectRow(11, inComponent: 0, animated: true)
                }
            }
            return
        default:
            break
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        switch component {
        case 0:
            return 200.0
        case 1:
            return 100.0
        default:
            break
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            let val = months[row]
            print("ActionSheetPickerCustomPickerDelegate2 Value at 0\(val)")
            return val
        case 1:
            let val = years[row]
            print("ActionSheetPickerCustomPickerDelegate2 Value at 1\(val)")
            return val
        default:
            break
        }
        return nil
    }
    
}

func getMonths() -> [String] {
    
    var months: [String] = []
    var monthIndex = 0
    
    for _ in 1...12 {
        let monthValue = DateFormatter().monthSymbols[monthIndex].capitalized
        months.append(monthValue)
        
        monthIndex += 1
    }
    return months
}

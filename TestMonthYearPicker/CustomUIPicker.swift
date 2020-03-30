//
//  CustomUIPicker.swift
//  TestMonthYearPicker
//
//  Created by Kavisha on 30/03/20.
//  Copyright © 2020 Kavisha. All rights reserved.
//

import UIKit

class CustomUIPicker: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var customMonth = "Custom"
    var customYearData = "All Notes"
    
    var months  = [String]()
    var years   = [String]()
    
    var selectedMonth = ""
    var selectedYear = ""
    
    override init() {
        var monthList = getMonths()
        monthList.append(customMonth)
        
        months  = monthList
        years   = ["2019", "2020", customYearData]
    }
    
    init(_ month: [String], _ year: [String]) {
        super.init()
        
        months  = month
        years   = year
    }
    
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



/*override var frameOfPresentedViewInContainerView: CGRect {
 var presentedViewFrame = CGRect.zero
 let containerBounds = containerView?.bounds
 
 if let containerBounds = containerBounds {
 presentedViewFrame.size = sizeForChildContentContainer(container: presentedViewController, withParentContainerSize: containerBounds.size)
 presentedViewFrame.origin.x = (containerBounds.size.width) - presentedViewFrame.size.width
 }
 return presentedViewFrame
 }
 
 func sizeForChildContentContainer(container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
 return CGSize(width: CGFloat((floorf(Float(parentSize.width / 3.0)))), height: parentSize.height)
 //return CGSizeMake(CGFloat((floorf(Float(parentSize.width / 3.0)))), parentSize.height)
 }*/



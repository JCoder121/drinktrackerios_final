//
//  ViewController.swift
//  drinktrackerios
//
//  Created by Jeffrey Chen on 12/22/19.
//  Copyright © 2019 Jeffrey Chen. All rights reserved.
//

import UIKit

class WaterViewController: UIViewController {
    
    //SET DRINKING WATER GOAL FOR 128 oz
    
    var goal: Double = 128
    
    @IBOutlet weak var displayLabel: UILabel!
           
    @IBOutlet weak var textField: UITextField!
       
       
    @IBOutlet weak var waterprogress: UIProgressView!
       
    @IBOutlet weak var addButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.keyboardType = UIKeyboardType.numberPad
        
        let defaults = UserDefaults.standard
           
        if let name = defaults.string(forKey: "name"){
           displayLabel.text = name
            
            final_water = Double(name)!
            
        waterprogress.progress = Float(final_water/goal)
        waterprogress.transform = waterprogress.transform.scaledBy(x: 1, y: 8)
        waterprogress.layer.cornerRadius = 10
        waterprogress.clipsToBounds = true
        waterprogress.layer.sublayers![1].cornerRadius = 10
        waterprogress.subviews[1].clipsToBounds = true
            
        
 
   
        }
 
    
    }
    
    var final_water: Double = 0
    
    var toAdd: Double = 0
    var calculate_progress: Double = 0
    

   

    @IBAction func saveButtonClick(sender: AnyObject) {
        
        self.view.endEditing(true)
        
        if isStringAnInt(string: textField.text!) == true {
            toAdd = Double(textField.text!)!
            final_water += toAdd
            displayLabel.text! = String(final_water)
        
            _ = UserDefaults.standard.set(displayLabel.text, forKey: "name")
       
            textField.text = ""
            
            let temp = Double(displayLabel.text!)!
            
            calculate_progress = temp/goal
            
            waterprogress.progress = Float(calculate_progress)
            
        }
        
      
    }
    
    func isStringAnInt(string: String) -> Bool {
        return Int(string) != nil
    }
    
    @IBAction func undoButton(_ sender: Any) {
        final_water -= toAdd
        displayLabel.text! = String(final_water)
        _ = UserDefaults.standard.set(displayLabel.text, forKey: "name")
        
        waterprogress.progress = Float(final_water/goal)
        
    }
    
    
    @IBAction func resetButton(_ sender: Any) {
        
        final_water = 0
        displayLabel.text = String(final_water)
        _ = UserDefaults.standard.set(displayLabel.text, forKey: "name")
        
        waterprogress.progress = 0
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
        
}






//
//  ViewController.swift
//  tips
//
//  Created by Chase Lee on 12/15/15.
//  Copyright © 2015 Chase Lee. All rights reserved.
//

import UIKit


var tipPercentages = [0.18, 0.2, 0.22]
var defaults = NSUserDefaults.standardUserDefaults()

class ViewController: UIViewController {
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Sets the title in the Navigation Bar
        self.title = "tip U"
        
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        billField.becomeFirstResponder()
           }
    
    override func viewWillAppear(animated: Bool) {
        // Set the default tip percentage from the user settings
        let intValue = defaults.integerForKey("defaultTip")
        let defaultTipValue = defaults.integerForKey("defaultTip")
        tipControl.selectedSegmentIndex = defaultTipValue
        
        updateValues()
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        updateValues()
    }
    
    func updateValues() {
        var tipPercentage  = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}


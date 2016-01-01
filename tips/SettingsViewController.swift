//
//  SettingsViewController.swift
//  tips
//
//  Created by Chase Lee on 12/31/15.
//  Copyright © 2015 Chase Lee. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipSegment: UISegmentedControl!
    var defaultTipPercentages = [0.18, 0.2, 0.22]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Sets the title in the Navigation Bar
        self.title = "Settings"
        
        // Do any additional setup after loading the view.
        
        // To load a key from NSUserDefaults
        
        var defaults = NSUserDefaults.standardUserDefaults()
        var intValue = defaults.integerForKey("defaultTip")
        var dafaultTipValue = defaults.integerForKey("defaultTip")
        
        defaultTipSegment.selectedSegmentIndex = dafaultTipValue
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDefaultTipChanged(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTipSegment.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
    }

    @IBAction func backButtonTouch(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

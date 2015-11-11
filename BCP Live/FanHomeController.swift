//
//  FanHomeController.swift
//  BCP Live
//
//  Created by Spencer on 11/10/15.
//  Copyright © 2015 Ryan Ebner. All rights reserved.
//

import UIKit

class FanHomeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // logout button
    @IBOutlet weak var fanLogoutButton: UIButton!
    
    // logout function
    @IBAction func fanLogout(sender: AnyObject){
        // code for switching to LoginController
        dismissViewControllerAnimated(true, completion:nil)
    }
}

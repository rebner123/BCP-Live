//
//  HomeController.swift
//  BCP Live
//
//  Created by Spencer on 11/8/15.
//  Copyright © 2015 Ryan Ebner. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    // greeting label
    @IBOutlet weak var greetLabel: UILabel!
    var greetText = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // changes the label based on given name
        greetLabel.text = "Hello, \(greetText)."
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBAction func logout(sender: AnyObject){
        // code for switching to LoginController
        dismissViewControllerAnimated(true, completion:nil)
    }
}
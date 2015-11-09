//
//  ViewController.swift
//  BCP Live
//
//  Created by Ryan Ebner on 11/8/15.
//  Copyright (c) 2015 Ryan Ebner. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // hides that awful navigationController bar at the top of the login screen
        self.navigationController?.navigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // function that passes data in fullNameField onto HomeController
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var DestViewController : HomeController = segue.destinationViewController as! HomeController
        DestViewController.greetText = fullNameField.text!
    }
    
    
    // login page buttons
    @IBOutlet weak var studentIDField: UITextField!
    @IBOutlet weak var fullNameField: UITextField!
    
    // student login function
    @IBAction func login(sender: AnyObject) {
        
        let studentID = self.studentIDField.text
        let fullName = self.fullNameField.text
        
        /* There are two ways to fail the login:
        1. the student ID doesn't exist
        2. the student ID exists but doesn't match the name
        */
    
        if students[studentID!] == nil{ // case 1
            let alert = UIAlertView(title: "Login Failed", message: "ID not found", delegate: self, cancelButtonTitle: "Ok")
            alert.show()
        }
        else if fullName! != students[studentID!] { // case 2
            let alert = UIAlertView(title: "Login Failed", message: "Name does not match ID", delegate: self, cancelButtonTitle: "Ok")
            alert.show()
        }
        else {
            performSegueWithIdentifier("loginSegue", sender: nil)
        }
    }
}
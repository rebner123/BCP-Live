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
    
    // function that passes data in fullNameField to HomeController
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // only sends data if its the student login segue
        if segue.identifier == "loginSegue"{
            let DestViewController : HomeController = segue.destinationViewController as! HomeController
            DestViewController.greetText = fullNameField.text!
        }
    }
    
    
    // login page buttons
    @IBOutlet weak var studentIDField: UITextField!
    @IBOutlet weak var fullNameField: UITextField!
    @IBOutlet weak var bcpFan: UIButton!
    
    // student login function
    @IBAction func login(sender: AnyObject) {
        
        // kills the keyboard so it doesn't glitch out in HomeController
        self.view.endEditing(true)
        
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
        else if fullName!.lowercaseString != students[studentID!]?.lowercaseString { // case 2
            let alert = UIAlertView(title: "Login Failed", message: "Name does not match ID", delegate: self, cancelButtonTitle: "Ok")
            alert.show()
        }
        else {
            // makes sure greeting is capitalized in case they don't capitalize their name in the text field
            fullNameField.text = students[studentID!]
            
            performSegueWithIdentifier("loginSegue", sender: nil)
            // clears text fields so they aren't filled after a logout
            // happens after segue so the fullNameField.text can be passed to HomeController via prepareForSegue
            studentIDField.text = ""
            fullNameField.text = ""
        }
    }
    
    // fan login function
    @IBAction func fanLogin(sender: AnyObject) {
        // bye bye keyboard
        self.view.endEditing(true)
        
        performSegueWithIdentifier("fanLogin", sender: nil)
        // clears text fields so they aren't filled after a logout
        // happens after segue so the fullNameField.text can be passed to HomeController via prepareForSegue
        studentIDField.text = ""
        fullNameField.text = ""
    }
}
//
//  ViewController.swift
//  BCP Live
//
//  Created by Ryan Ebner on 11/8/15.
//  Copyright (c) 2015 Ryan Ebner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    
    @IBOutlet weak var studentIDField: UITextField!
    @IBOutlet weak var fullNameField: UITextField!
    
    
    @IBAction func signUpAction(sender: AnyObject) {
        
        let studentID = self.studentIDField.text
        let fullName = self.fullNameField.text
    
        
        // Validate the text fields
        if studentID!.characters.count < 6 {
            let alert = UIAlertView(title: "Invalid", message: "Input Valid Student ID", delegate: self, cancelButtonTitle: "OK")
            alert.show()
            
        } else if fullName!.characters.count < 8 {
            let alert = UIAlertView(title: "Invalid", message: "Input First and Last name separated by a space", delegate: self, cancelButtonTitle: "OK")
            alert.show()
            
        } else {
            // Run a spinner to show a task in progress
            let spinner: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 150)) as UIActivityIndicatorView
            spinner.startAnimating()
            
            let alert = UIAlertView(title: "Success", message: "Great JOB!", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        
            
            
        }
    }
    
}


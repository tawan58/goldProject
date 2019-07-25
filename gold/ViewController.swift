//
//  ViewController.swift
//  gold
//
//  Created by Admin on 20/7/2562 BE.
//  Copyright © 2562 Kate. All rights reserved.
//

import UIKit
import Firebase
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!

    
    
    var ref:DatabaseReference!
    var maskClick = true

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Set the firebase reference
        ref = Database.database().reference()
    }
    //Open and hidden password
    @IBAction func maskAction(_ sender: Any) {
        if maskClick == true {
            password.isSecureTextEntry = false
        }else{
            password.isSecureTextEntry = true
        }
        maskClick = !maskClick
    }
    @IBAction func Continue(_ sender: Any) {
        
        var emailTxt = self.email.text
        var passwordTxt = self.password.text
        
        if emailTxt == "" && passwordTxt == "" && emailTxt?.range(of: "@") == nil && passwordTxt!.count == 0 {
            
            //Alert for register complete
            let alert = UIAlertController(title: "Register", message: "Plese enter your email and password.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        
            //Email and Password empty
            if emailTxt == "" && passwordTxt == "" {
                label1.text = "Invalid email address"
                label1.textColor = UIColor.red
                label2.text = "Password must be a minimum of 8 characters."
                label2.textColor = UIColor.red
            }
            //Email empty
            if emailTxt?.range(of: "@") == nil{
                label1.text = "Invalid email address"
                label1.textColor = UIColor.red
            }
            //Password empty
            if passwordTxt!.count < 8 {
                label2.text = "Password must be a minimum of 8 characters."
                label2.textColor = UIColor.red
            }
        
            if emailTxt != "" && passwordTxt != "" && emailTxt?.range(of: "@") != nil && passwordTxt!.count >= 8 {
                label1.text = ""
                label2.text = ""
            }
        
            //ToDo post the data to firebase
            ref.child("Customers").child("Customer3").childByAutoId().setValue(emailTxt)
            ref.child("Customers").child("Customer3").childByAutoId().setValue(passwordTxt)
        }

    } // close ContinueAction
}


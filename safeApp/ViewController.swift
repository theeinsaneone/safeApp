//
//  ViewController.swift
//  safeApp
//
//  Created by Abhishek Dhall on 19/05/19.
//  Copyright © 2019 Abhishek Dhall. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController
{
    
    @IBOutlet weak var elabel: UILabel!
    @IBOutlet weak var plabel: UILabel!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var actionButton: UIButton!
    
    @IBAction func action(_ sender: Any)
    {
        if emailText.text != "" && passText.text != ""
        {
            if segmentControl.selectedSegmentIndex == 0
            {
                Auth.auth().signIn(withEmail: emailText.text!, password: passText.text!, completion: {(user,error) in
                    if  user != nil
                    {
                        self.performSegue(withIdentifier: "segue", sender: self)
                        self.emailText.text = ""
                        self.passText.text = ""
                    }
                    else
                    {
                        if let myError = error?.localizedDescription
                        {
                            print(myError)
                        }
                        else
                        {
                            print("Error")
                        }
                    }
                })
            }
        else
            {
                Auth.auth().createUser(withEmail: emailText.text!, password: passText.text!, completion: {(user,error) in
                    if  user != nil
                    {
                        self.performSegue(withIdentifier: "segue", sender: self)
                        self.emailText.text = ""
                        self.passText.text = ""                    }
                    else
                    {
                        if let myError = error?.localizedDescription
                        {
                            print(myError)
                        }
                        else
                        {
                            print("Error")
                        }
                    }
                })
            }

    
            func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


        }
}
}





//
//  ViewController2.swift
//  safeApp
//
//  Created by Abhishek Dhall on 21/05/19.
//  Copyright © 2019 Abhishek Dhall. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController2: UIViewController {

    @IBAction func logOut(_ sender: UIButton)
    {
        createAlert(title: "WARNING", message: "Are you sure you want to log out?")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(Auth.auth().currentUser?.email)
    }
    
    func createAlert (title: String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: {(action) in
            try! Auth.auth().signOut()
            self.dismiss(animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: {(action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true)
    }

}

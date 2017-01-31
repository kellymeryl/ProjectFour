//
//  EntryScreenViewController.swift
//  ProjectFour-KellyMcNevin
//
//  Created by Kelly McNevin on 1/30/17.
//  Copyright © 2017 Kelly McNevin. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class EntryScreenViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButtonWasTapped(_ sender: Any) {
        FirebaseModel.sharedInstance.login(email: usernameTextField.text!, password: passwordTextField.text!, viewController: self, complete: { [weak self] success in
            guard let strongSelf = self else {return}
            DispatchQueue.main.async {
                print("==============login successful!==============")
                strongSelf.performSegue(withIdentifier: "LoginToHomeScreen", sender: self)
            }
        })
    }
    
    @IBAction func signUpButtonWasTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "ToSignupScreen", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

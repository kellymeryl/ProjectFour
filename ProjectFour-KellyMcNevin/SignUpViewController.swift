//
//  SignUpViewController.swift
//  ProjectFour-KellyMcNevin
//
//  Created by Kelly McNevin on 1/30/17.
//  Copyright © 2017 Kelly McNevin. All rights reserved.
//

import UIKit
import Firebase


class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    
    @IBAction func signupButtonWasTapped(_ sender: Any) {
        
        if usernameTextField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter a valid username", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else if emailTextField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter a valid email", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else if passwordTextField.text != confirmPasswordTextField.text {
            let alertController = UIAlertController(title: "Error", message: "Passwords do not match", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else if passwordTextField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter a valid password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else if confirmPasswordTextField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please confirm password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else if confirmPasswordTextField.text!.characters.count < 6 {
            
            let alertController = UIAlertController(title: "Error", message: "Please enter a password that is longer than 6 characters", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
        else {
            FirebaseModel.sharedInstance.signup(viewController: self, name: usernameTextField.text!, emailTextField: emailTextField.text!, passwordTextField: passwordTextField.text!, complete: { success in
                print(success)
          /*  let homeStoryboard: UIStoryboard = UIStoryboard(name: "HomeUI", bundle: nil)
            let vc = homeStoryboard.instantiateInitialViewController()
            self.present(vc!, animated: true, completion: nil)*/
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

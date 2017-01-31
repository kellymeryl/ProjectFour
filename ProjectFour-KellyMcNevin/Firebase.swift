//
//  Firebase.swift
//  ProjectFour-KellyMcNevin
//
//  Created by Kelly McNevin on 1/30/17.
//  Copyright © 2017 Kelly McNevin. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase

class FirebaseModel {
    
    static let sharedInstance = FirebaseModel()
    
    func addUser(name: String) {
        guard let user = FIRAuth.auth()?.currentUser else {
            return
        }
        let userRef = FIRDatabase.database().reference(withPath: "user")
        let userChild = userRef.child(user.uid)
        
        let userName = userChild.child("name")
        userName.setValue(name)
    }
    
    func login(email: String, password: String, viewController: UIViewController, complete: @escaping (Bool)->()) {
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password) { [weak viewController] user, error in
            if user == nil {
                let alertController = UIAlertController(title: "Error", message: "Username/Password Not Recognized", preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                viewController?.present(alertController, animated: true, completion: nil)
            }
            complete(user != nil)
        }
    }
    
    func signup(viewController:UIViewController, name: String, emailTextField: String, passwordTextField:String, complete: @escaping (Bool)->()) {
        if emailTextField == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter a valid email address", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            viewController.present(alertController, animated: true, completion: nil)
        }
        else {
            FIRAuth.auth()?.createUser(withEmail: emailTextField, password: passwordTextField, completion: { (user, error) in
                
                if error == nil {
                    self.addUser(name: name)
                    complete(user != nil)
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    viewController.present(alertController, animated: true, completion: nil)
                }
            })
        }
    }
    
    func logout() {
        
        do {
            try FIRAuth.auth()?.signOut()
        } catch {
            print(error)
        }
    }

}

//
//  FitbitLoginViewController.swift
//  ProjectFour-KellyMcNevin
//
//  Created by Kelly McNevin on 1/31/17.
//  Copyright © 2017 Kelly McNevin. All rights reserved.
//

import UIKit
import OAuthSwift
import SafariServices

class FitbitLoginViewController: OAuthViewController, OAuthSwiftURLHandlerType {
    
    @IBOutlet var myView: UIView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var dataModel = DataModel()
    @IBOutlet weak var button: UIButton!

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginWithFitbitWasTapped(_ sender: Any) {

        startSpinning()
        doOAuthFitbit2(["consumerKey": "2283YY", "consumerSecret": "42daea49cdb4d55f355d2f03fc988bc1"])
        stopSpinning()
    }
    
    func startSpinning() {
        spinner.isHidden = false
        spinner.startAnimating()
    }
    
    func stopSpinning() {
        spinner.stopAnimating()
        spinner.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.isHidden = true
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 5.0
        
        button.frame = CGRect(x: 91, y: 311, width: 193, height: 44)
        button.setTitle("Login With Fitbit", for: UIControlState.normal)
        button.setTitleColor(UIColor.white, for: UIControlState.normal)
        button.backgroundColor = UIColor.clear
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
        button.layer.cornerRadius = cornerRadius
        
        myView.layer.borderWidth = 1
        myView.layer.borderColor = UIColor.white.cgColor

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doOAuthFitbit2(_ serviceParameters: [String:String]) {
        let oauthswift = OAuth2Swift(
            consumerKey:    serviceParameters["consumerKey"]!,
            consumerSecret: serviceParameters["consumerSecret"]!,
            authorizeUrl:   "https://www.fitbit.com/oauth2/authorize",
            accessTokenUrl: "https://api.fitbit.com/oauth2/token",
            responseType:   "code"
        )
        oauthswift.accessTokenBasicAuthentification = true
        
        dataModel.oauthswift = oauthswift
        oauthswift.authorizeURLHandler = SafariURLHandler(viewController: self, oauthSwift: oauthswift)
        let state = generateState(withLength: 20)
        let _ = oauthswift.authorize(
            withCallbackURL: URL(string: "oauth-swift://oauth-callback/fitbit2")!, scope: "sleep+profile" , state: state,
            success: { credential, response, parameters in
                
                print("success")
                self.dataModel.testFitbit2(oauthswift)
                
                (UIApplication.shared.delegate as! AppDelegate).transitionFromAuthToApp()
                
        },
            failure: { error in
                print(error.description)
        }
        )
    }
    
    func handle(_ url: URL) {
        print(url)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        var tabBarController = segue.destination as! UITabBarController;
//        let nav = tabBarController.viewControllers![1] as! UINavigationController
//     //   let destinationViewController = nav.viewControllers[0] as!
//    }
    

}

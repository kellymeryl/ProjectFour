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
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var dataModel = DataModel()

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginWithFitbitWasTapped(_ sender: Any) {

        startSpinning()
        doOAuthFitbit2(["consumerKey": "2283YY", "consumerSecret": "42daea49cdb4d55f355d2f03fc988bc1"])

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
                self.stopSpinning()
                
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

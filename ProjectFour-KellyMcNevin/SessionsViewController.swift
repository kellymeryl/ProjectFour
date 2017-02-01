//
//  SessionsViewController.swift
//  ProjectFour-KellyMcNevin
//
//  Created by Kelly McNevin on 1/31/17.
//  Copyright © 2017 Kelly McNevin. All rights reserved.
//

import UIKit
import FontAwesomeKit_Swift

class SessionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var sessionsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SessionsTableViewCell", for: indexPath) as! SessionsTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

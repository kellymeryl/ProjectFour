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
    
  //  var users = [UserSleep]()
    
    var selectedIndex: Int?
    var selectedCell: SessionsTableViewCell?

    
    @IBOutlet weak var sessionsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count 
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SessionsTableViewCell", for: indexPath) as! SessionsTableViewCell
        let user = users[indexPath.row]
       // let myFormatter = DateFormatter()
       // myFormatter.dateStyle = .short
       // let date = myFormatter.date(from: user.startTime)
       // myFormatter.dateStyle = .short
       // let stringDate = myFormatter.string(from: date!)
        cell.dateLabel.text = user.startTime
        let duration = Double(user.duration)
        let durationLabelText = String((duration! / 1000) * 0.000277778) + " hrs"
        cell.durationLabel.text = durationLabelText
        cell.efficiencyLabel.text = user.efficiency + "%"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let cell = tableView.cellForRow(at: indexPath) as! SessionsTableViewCell
        
        if cell === selectedCell {
            cell.backgroundColor = UIColor.white
            selectedCell = nil
        }
        else {
            cell.backgroundColor = UIColor.lightGray
        }
            selectedCell?.backgroundColor = UIColor.white
            selectedCell = cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let detailedItem = segue.destination as! SleepAnalysisViewController
        detailedItem.selectedIndex = sessionsTableView.indexPathForSelectedRow?.row
        
    }
    

}


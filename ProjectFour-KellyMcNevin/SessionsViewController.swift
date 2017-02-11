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
      //  let myFormatter = DateFormatter()
        let cornerRadius : CGFloat = 5.0

        let stringDate = user.startTime
       // var date = stringDate.date
       // let date = myFormatter.date(from: stringDate)
       // let newDate = date?.ddMMYY
     /*   var newDate = ""
        var x = 0
        for elements in stringDate.characters {
            while x <= 10 {
                newDate.append(elements)
            }
            x += 1
        }*/
        cell.dateLabel.text = stringDate
        let duration = Double(user.duration)
        let durationVar = Double((duration! / 1000) * 0.000277778)
        let durationLabelText = String(format: "%.2f", durationVar) + " hrs"
        cell.durationLabel.text = durationLabelText
        cell.efficiencyLabel.text = user.efficiency + "%"
        cell.layer.borderColor = UIColor.gray.cgColor
   //     cell.layer.cornerRadius = cornerRadius
        cell.layer.borderWidth = 1
        
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

extension Date {
    var scr_formatted : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return dateFormatter.string(from: self)
    }
    
    var ddMMYY : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/YY"
        return dateFormatter.string(from: self)
    }
    
    var monthDayYearAtTimeString : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/YY @ hh:mm"
        return dateFormatter.string(from: self)
    }
}

extension String {
    var date: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y-M-d H:m:s.S"
        return (dateFormatter.date(from: self))
    }
}



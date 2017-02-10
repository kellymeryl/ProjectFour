//
//  IndividualNoteViewController.swift
//  ProjectFour-KellyMcNevin
//
//  Created by Kelly McNevin on 2/6/17.
//  Copyright © 2017 Kelly McNevin. All rights reserved.
//

import UIKit

class IndividualNoteViewController: UIViewController {

    @IBOutlet weak var textField: UITextView!

    var selectedIndex: Int?
    var selectedCellIndex: Int?
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var note: Notes!
    var user: UserSleep!
    
    @IBAction func saveButtonWasTapped(_ sender: Any) {
        
        let newNote = Notes(note: textField.text, date: dateLabel.text!)
        notes.append(newNote)
        dismissViewController()
    }
    
    func dismissViewController() {
        self.performSegue(withIdentifier: "unwindFromNotesVC", sender: self)
    }

    @IBAction func deleteButtonWasTapped(_ sender: Any) {
        textField.text = ""

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
   //     user = users[selectedIndex!]
      //  print(selectedCellIndex!)
        if note != nil {
            textField.text = note.note
        }
        
      /*  let dateFormatter = DateFormatter()
        var dateUnformatted = user.startTime
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        var dateInDateForm = dateFormatter.date(from: dateUnformatted)*/
   //     dateLabel.text = user.startTime
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension Date {
    
    var prettyLocaleFormatted : String {
        return DateFormatter.localizedString(from: self, dateStyle: .medium, timeStyle: .none)
    }
}

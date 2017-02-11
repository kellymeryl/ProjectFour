//
//  IndividualNoteViewController.swift
//  ProjectFour-KellyMcNevin
//
//  Created by Kelly McNevin on 2/6/17.
//  Copyright © 2017 Kelly McNevin. All rights reserved.
//

import UIKit

class IndividualNoteViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextView!

    var selectedIndex: Int?
    var selectedCellIndex: Int?
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var note: Notes!
    var user: UserSleep!
    
    @IBAction func saveButtonWasTapped(_ sender: Any) {
        
        if textField.text == "" {
            
            let alertVC = UIAlertController(title: "Diary Entry Error", message: "There is no text to save in this note.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style:.default, handler: nil)
            alertVC.addAction(okAction)
            present(alertVC, animated: true, completion: nil)

            
        } else {
        
        let newNote = Notes(note: textField.text, date: dateLabel.text!)
        FirebaseModel.sharedInstance.addNote(noteString: textField.text, date: dateLabel.text!)
        notes.append(newNote)
            let alertVC = UIAlertController(title: "Diary Entry", message: "Save Successful!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style:.default, handler: nil)
            alertVC.addAction(okAction)
            present(alertVC, animated: true, completion: nil)

        
        
        
      //  dismissViewController()
        }
    }
    
    func dismissViewController() {
        self.performSegue(withIdentifier: "unwindFromNotesVC", sender: self)
    }

    @IBAction func deleteButtonWasTapped(_ sender: Any) {
        
        if textField.text == "" || notes.count == 0 {
            
            let alertVC = UIAlertController(title: "Diary Entry Error", message: "There is no text to delete in this note.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style:.default, handler: nil)
            alertVC.addAction(okAction)
            present(alertVC, animated: true, completion: nil)
            
            
        }
        else {
            
            textField.text = ""
            notes.remove(at: selectedIndex!)
            FirebaseModel.sharedInstance.deleteData(key: "note")
       //     dismissViewController()
            let alertVC = UIAlertController(title: "Diary Entry", message: "Delete Successful!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style:.default, handler: nil)
            alertVC.addAction(okAction)
            present(alertVC, animated: true, completion: nil)
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 5.0
        
        button.frame = CGRect(x: 16, y: 578, width: 343, height: 30)
        button.setTitle("Delete", for: UIControlState.normal)
        button.setTitleColor(UIColor.white, for: UIControlState.normal)
        button.backgroundColor = UIColor.clear
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
        button.layer.cornerRadius = cornerRadius
        
        textField.layer.cornerRadius = cornerRadius

   //     user = users[selectedIndex!]
      //  print(selectedCellIndex!)
        if note != nil {
            textField.text = note.note
        }
        
     /*   let dateFormatter = DateFormatter()
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

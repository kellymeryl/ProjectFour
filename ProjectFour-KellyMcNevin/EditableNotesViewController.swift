//
//  EditableNotesViewController.swift
//  ProjectFour-KellyMcNevin
//
//  Created by Kelly McNevin on 2/7/17.
//  Copyright © 2017 Kelly McNevin. All rights reserved.
//

import UIKit

class EditableNotesViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    var selectedIndex: Int?
    var note: Notes!

    @IBAction func saveButtonWasTapped(_ sender: Any) {
        
        if textField.text == "" {
            
            let alertVC = UIAlertController(title: "Diary Entry Error", message: "There is no text to save in this note.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style:.default, handler: nil)
            alertVC.addAction(okAction)
            present(alertVC, animated: true, completion: nil)
            
            
        } else {
            
        let newNote = Notes(note: textField.text, date: titleLabel.text!)
        notes.append(newNote)
        FirebaseModel.sharedInstance.addNote(noteString: textField.text, date: titleLabel.text!)

            
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
        
        if textField.text == "" {
            
        let alertVC = UIAlertController(title: "Diary Entry Error", message: "There is no text to delete in this note.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style:.default, handler: nil)
        alertVC.addAction(okAction)
        present(alertVC, animated: true, completion: nil)
            
            
        }
        else {
            
        notes.remove(at: selectedIndex!)
        textField.text = ""

        FirebaseModel.sharedInstance.deleteData(key: "note")
            let alertVC = UIAlertController(title: "Diary Entry", message: "Delete Successful!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style:.default, handler: nil)
            alertVC.addAction(okAction)
            present(alertVC, animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var textField: UITextView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        note = notes[selectedIndex!]
        titleLabel.text = note.date
        textField.text = note.note
        
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

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

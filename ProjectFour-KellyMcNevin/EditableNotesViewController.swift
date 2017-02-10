//
//  EditableNotesViewController.swift
//  ProjectFour-KellyMcNevin
//
//  Created by Kelly McNevin on 2/7/17.
//  Copyright © 2017 Kelly McNevin. All rights reserved.
//

import UIKit

class EditableNotesViewController: UIViewController {

    var selectedIndex: Int?
    var note: Notes!

    @IBAction func saveButtonWasTapped(_ sender: Any) {
        let newNote = Notes(note: textField.text, date: titleLabel.text!)
        notes.append(newNote)
        dismissViewController()
    }
    
    func dismissViewController() {
        self.performSegue(withIdentifier: "unwindFromNotesVC", sender: self)
    }
    
    @IBAction func deleteButtonWasTapped(_ sender: Any) {
        
        notes.remove(at: selectedIndex!)
    }
    
    @IBOutlet weak var textField: UITextView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        note = notes[selectedIndex!]
        titleLabel.text = note.date
        textField.text = note.note
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

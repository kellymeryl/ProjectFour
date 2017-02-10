//
//  NotesViewController.swift
//  ProjectFour-KellyMcNevin
//
//  Created by Kelly McNevin on 1/31/17.
//  Copyright © 2017 Kelly McNevin. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class NotesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {

    @IBOutlet weak var notesTableView: UITableView!
    var selectedIndex: Int?
    var selectedCellIndex: Int?
    var selectedCell: NotesTableViewCell?
    
    var individualViewController: IndividualNoteViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        notesTableView.reloadData()
     
        self.notesTableView.emptyDataSetSource = self
        self.notesTableView.emptyDataSetDelegate = self
        self.notesTableView.tableFooterView = UIView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addNoteButtonWasTapped(_ sender: Any) {
        individualViewController?.textField.text = ""
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotesTableViewCell", for: indexPath) as! NotesTableViewCell
        cell.noteTextField.text = notes[indexPath.row].note
        cell.noteDateLabel.text = notes[indexPath.row].date
        selectedCellIndex = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! NotesTableViewCell
        
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
    
    //Empty Table View-------------------------------------------
    
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "Unknown.png")
    }
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "You have no notes"
        let attribs = [
            NSFontAttributeName: UIFont.boldSystemFont(ofSize: 18),
            NSForegroundColorAttributeName: UIColor.darkGray
        ]
        
        return NSAttributedString(string: text, attributes: attribs)
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "Add notes to track your dreams. Add your first note by tapping the + button."
        
        let para = NSMutableParagraphStyle()
        para.lineBreakMode = NSLineBreakMode.byWordWrapping
        para.alignment = NSTextAlignment.center
        
        let attribs = [
            NSFontAttributeName: UIFont.systemFont(ofSize: 14),
            NSForegroundColorAttributeName: UIColor.lightGray,
            NSParagraphStyleAttributeName: para
        ]
        
        return NSAttributedString(string: text, attributes: attribs)
    }
    
    func buttonTitleforEmptyDataSetforForEmptyDataSet(_ scrollView: UIScrollView!, forState state: UIControlState) -> NSAttributedString! {
        let text = "Add First Diary Entry"
        let attribs = [
            NSFontAttributeName: UIFont.boldSystemFont(ofSize: 16),
            NSForegroundColorAttributeName: view.tintColor
        ] as [String : Any]
        
        return NSAttributedString(string: text, attributes: attribs)
    }

    func emptyDataSetDidTapButton(_ scrollView: UIScrollView!) {
        print("Tapped")
    }
    
    func emptyDataSetShouldDisplay(_ scrollView: UIScrollView!) -> Bool {
        if notes.count == 0 {
            return true
        }
        else {
            return false
        }
    }
    
    func emptyDataSetShouldAllowTouch(_ scrollView: UIScrollView!) -> Bool {
        return true
    }
    
    func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView!) -> Bool {
        return false
    }
    
    func emptyDataSetShouldAnimateImageView(_ scrollView: UIScrollView!) -> Bool {
        return false
    }
    
    func emptyDataSet(_ scrollView: UIScrollView!, didTap view: UIView!) {
        //code
    }
    
    func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!) {
        //code
    }
    
    func backgroundColor(forEmptyDataSet scrollView: UIScrollView!) -> UIColor! {
       return UIColor.white
    }
    
    func verticalOffset(forEmptyDataSet scrollView: UIScrollView!) -> CGFloat {
        return -64.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailedItem = segue.destination as! EditableNotesViewController
        detailedItem.selectedIndex = notesTableView.indexPathForSelectedRow?.row
        //detailedItem.selectedCellIndex = selectedCellIndex
    }

    
}

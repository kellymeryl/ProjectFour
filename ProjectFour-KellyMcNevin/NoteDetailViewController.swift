//
//  NoteDetailViewController.swift
//  ProjectFour-KellyMcNevin
//
//  Created by Kelly McNevin on 2/1/17.
//  Copyright © 2017 Kelly McNevin. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {

    @IBAction func editButtonWasTapped(_ sender: Any) {
        //make notes editable
    }
    
    @IBOutlet weak var noteDetailDateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  DataModel.swift
//  ProjectFour-KellyMcNevin
//
//  Created by Kelly McNevin on 1/30/17.
//  Copyright © 2017 Kelly McNevin. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
import UIKit

class DataModel {

    static let sharedInstance = DataModel()

    var user: User?
}

struct User {
    
    var name: String
    var uID: String?
    var reference: FIRDatabaseReference?
    
    init(name:String) {
        self.name = name
    }
    init(snapshot: FIRDataSnapshot) {

        let userName = snapshot.childSnapshot(forPath: "name")
        name = userName.value as! String
        
        uID = snapshot.key
        reference = snapshot.ref
    }
}

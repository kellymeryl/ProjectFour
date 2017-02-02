//
//  DataModel.swift
//  ProjectFour-KellyMcNevin
//
//  Created by Kelly McNevin on 1/30/17.
//  Copyright © 2017 Kelly McNevin. All rights reserved.
//

import Foundation
import UIKit
import OAuthSwift

class DataModel {

    static let sharedInstance = DataModel()
    
    var oauthswift = OAuth2Swift(
        consumerKey:    fitbit_clientID,
        consumerSecret: fitbit_consumer_secret,
        authorizeUrl:   "https://www.fitbit.com/oauth2/authorize",
        accessTokenUrl: "https://api.fitbit.com/oauth2/token",
        responseType:   "token"
    )

    func testFitbit2(_ oauthswift: OAuth2Swift) {
        let _ = oauthswift.client.get(
            "https://api.fitbit.com/1/user/-/profile.json",
            parameters: [:],
            success: { response in
                let jsonDict = try? response.jsonObject()
                let jsonDictionary = jsonDict as? [String: Any] ?? [:]
            //    self.getFitbitData(jsonDictionary)
                //   print(jsonDict as Any)
                print(jsonDictionary)
        },
            failure: { error in
                print(error.description)
        }
        )
    }
    
    func getFitbitData(_ json: [String: Any]) -> [UserSleep] {
        
        let listOfSleeps = json["sleep"] as! [[String: Any]]
        
        var users = [UserSleep]()
        
        for sleep in listOfSleeps {
            let logId = sleep["logID"] as? String ?? ""
            let efficiency = sleep["efficiency"] as? String ?? ""
            let startTime = sleep["startTime"] as? String ?? ""
            let duration = sleep["duration"] as? String ?? ""
            let minutesToFallAsleep = sleep["minutesToFallAsleep"] as? String ?? ""
            let minutesAsleep = sleep["minutesAsleep"] as? String ?? ""
            let minutesAwake = sleep["minutesAwake"] as? String ?? ""
            let awakeningsCounted = sleep["awakeningsCounted"] as? String ?? ""
            let awakeCount = sleep["awakeCount"] as? String ?? ""
            let timeInBed = sleep["timeInBed"] as? String ?? ""
            let awakeDuration = sleep["awakeDuration"] as? String ?? ""
            let restlessCount = sleep["restlessCount"] as? String ?? ""
            let restlessDuration = sleep["restlessDuration"] as? String ?? ""
            let minuteData = sleep["minuteData"] as? [[String: Any]] ?? [[:]]
            let user = UserSleep(logID: logId, efficiency: efficiency, startTime: startTime, duration: duration, minutesToFallAsleep: minutesToFallAsleep, minutesAsleep: minutesAsleep, minutesAwake: minutesAwake, awakeningsCounted: awakeningsCounted, awakeCount: awakeCount, awakeDuration: awakeDuration, restlessCount: restlessCount, restlessDuration: restlessDuration, timeInBed: timeInBed, minuteData: minuteData)
        }
        return users
    }
    

}



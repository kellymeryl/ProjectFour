//
//  ClassDataModel.swift
//  ProjectFour-KellyMcNevin
//
//  Created by Kelly McNevin on 2/2/17.
//  Copyright © 2017 Kelly McNevin. All rights reserved.
//

import Foundation
import OAuthSwift

class UserSleep {
    
    var logID: String
    var notes: String?
    var efficiency: String
    var startTime: String
    var duration: String
    var minutesToFallAsleep: String
    var minutesAsleep: String
    var minutesAwake: String
    var awakeningsCounted: String
    var awakeCount: String
    var awakeDuration: String
    var restlessCount: String
    var restlessDuration: String
    var timeInBed: String
    var minuteData: [[String: Any]]
    
    init(logID: String, efficiency: String, startTime: String, duration: String, minutesToFallAsleep: String, minutesAsleep: String, minutesAwake: String, awakeningsCounted: String, awakeCount: String, awakeDuration: String, restlessCount: String, restlessDuration: String, timeInBed: String, minuteData : [[String: Any]] ) {
        self.logID = logID
        self.efficiency = efficiency
        self.startTime = startTime
        self.duration = duration
        self.minutesToFallAsleep = minutesToFallAsleep
        self.minutesAsleep = minutesAsleep
        self.minutesAwake = minutesAwake
        self.awakeningsCounted = awakeningsCounted
        self.awakeCount = awakeCount
        self.awakeDuration = awakeDuration
        self.restlessCount = restlessCount
        self.restlessDuration = restlessDuration
        self.timeInBed = timeInBed
        self.minuteData = minuteData
    }
}

var users = [

    UserSleep(logID: "12354", efficiency: "98", startTime: "2011-06-16T00:00:00.000", duration: "28800000", minutesToFallAsleep: "0", minutesAsleep: "480", minutesAwake: "20", awakeningsCounted: "3", awakeCount: "2", awakeDuration: "0", restlessCount: "0", restlessDuration: "0", timeInBed: "480", minuteData: [["dateTime": "00:00:00:", "value" : "3"], ["dateTime": "00:01:00:", "value" : "2"], ["dateTime": "00:02:00:", "value" : "1"]]),
    UserSleep(logID: "12354", efficiency: "90", startTime: "2011-06-16T00:00:00.000", duration: "28800000", minutesToFallAsleep: "0", minutesAsleep: "480", minutesAwake: "20", awakeningsCounted: "3", awakeCount: "2", awakeDuration: "0", restlessCount: "0", restlessDuration: "0", timeInBed: "480", minuteData: [["dateTime": "00:00:00:", "value" : "3"], ["dateTime": "00:01:00:", "value" : "2"], ["dateTime": "00:02:00:", "value" : "1"]]),
    UserSleep(logID: "12354", efficiency: "80", startTime: "2011-06-16T00:00:00.000", duration: "28800000", minutesToFallAsleep: "0", minutesAsleep: "480", minutesAwake: "20", awakeningsCounted: "3", awakeCount: "2", awakeDuration: "0", restlessCount: "0", restlessDuration: "0", timeInBed: "480", minuteData: [["dateTime": "00:00:00:", "value" : "3"], ["dateTime": "00:01:00:", "value" : "2"], ["dateTime": "00:02:00:", "value" : "1"]]),
    UserSleep(logID: "12354", efficiency: "70", startTime: "2011-06-16T00:00:00.000", duration: "28800000", minutesToFallAsleep: "0", minutesAsleep: "480", minutesAwake: "20", awakeningsCounted: "3", awakeCount: "2", awakeDuration: "0", restlessCount: "0", restlessDuration: "0", timeInBed: "480", minuteData: [["dateTime": "00:00:00:", "value" : "3"], ["dateTime": "00:01:00:", "value" : "2"], ["dateTime": "00:02:00:", "value" : "1"]]),
    UserSleep(logID: "12354", efficiency: "75", startTime: "2011-06-16T00:00:00.000", duration: "28800000", minutesToFallAsleep: "0", minutesAsleep: "480", minutesAwake: "20", awakeningsCounted: "3", awakeCount: "2", awakeDuration: "0", restlessCount: "0", restlessDuration: "0", timeInBed: "480", minuteData: [["dateTime": "00:00:00:", "value" : "3"], ["dateTime": "00:01:00:", "value" : "2"], ["dateTime": "00:02:00:", "value" : "1"]]),
    UserSleep(logID: "12354", efficiency: "80", startTime: "2011-06-16T00:00:00.000", duration: "28800000", minutesToFallAsleep: "0", minutesAsleep: "480", minutesAwake: "20", awakeningsCounted: "3", awakeCount: "2", awakeDuration: "0", restlessCount: "0", restlessDuration: "0", timeInBed: "480", minuteData: [["dateTime": "00:00:00:", "value" : "3"], ["dateTime": "00:01:00:", "value" : "2"], ["dateTime": "00:02:00:", "value" : "1"]]),
    UserSleep(logID: "12354", efficiency: "98", startTime: "2011-06-16T00:00:00.000", duration: "28800000", minutesToFallAsleep: "0", minutesAsleep: "480", minutesAwake: "20", awakeningsCounted: "3", awakeCount: "2", awakeDuration: "0", restlessCount: "0", restlessDuration: "0", timeInBed: "480", minuteData: [["dateTime": "00:00:00:", "value" : "3"], ["dateTime": "00:01:00:", "value" : "2"], ["dateTime": "00:02:00:", "value" : "1"]]),
    UserSleep(logID: "12354", efficiency: "90", startTime: "2011-06-16T00:00:00.000", duration: "28800000", minutesToFallAsleep: "0", minutesAsleep: "480", minutesAwake: "20", awakeningsCounted: "3", awakeCount: "2", awakeDuration: "0", restlessCount: "0", restlessDuration: "0", timeInBed: "480", minuteData: [["dateTime": "00:00:00:", "value" : "3"], ["dateTime": "00:01:00:", "value" : "2"], ["dateTime": "00:02:00:", "value" : "1"]]),
    UserSleep(logID: "12354", efficiency: "100", startTime: "2011-06-16T00:00:00.000", duration: "28800000", minutesToFallAsleep: "0", minutesAsleep: "480", minutesAwake: "20", awakeningsCounted: "3", awakeCount: "2", awakeDuration: "0", restlessCount: "0", restlessDuration: "0", timeInBed: "480", minuteData: [["dateTime": "00:00:00:", "value" : "3"], ["dateTime": "00:01:00:", "value" : "2"], ["dateTime": "00:02:00:", "value" : "1"]])

]

class Notes {
    var note: String?
    var date: String?
    
    init(note: String, date: String) {
        self.note = note
        self.date = date
    }
}

var notes = [Notes]()

//
//  SleepAnalysisViewController.swift
//  ProjectFour-KellyMcNevin
//
//  Created by Kelly McNevin on 1/31/17.
//  Copyright © 2017 Kelly McNevin. All rights reserved.
//

import UIKit
import Charts

class SleepAnalysisViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBAction func addNewWasTapped(_ sender: Any) {
        individualViewController?.textField.text = "" 
    }
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
   // @IBOutlet weak var barChartView: BarChartView!
    
    var individualViewController: IndividualNoteViewController?
    var selectedIndex: Int?
    
    var user: UserSleep!
    
    var arrayOfTitles = ["Efficiency", "Start Time", "Duration", "Minutes To Sleep", "Minutes Asleep", "Minutes Awake", "Awake Count", "Awake Duration", "Restless Count", "Restless Duration", "Time In Bed"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        user = users[selectedIndex!]
        dateLabel.text! = user.startTime
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SleepAnalysisCollectionViewCell", for: indexPath) as! SleepAnalysisCollectionViewCell
        
        if indexPath.row == 0 {
                cell.titleLabel.text = arrayOfTitles[0]
                cell.numberLabel.text = users[selectedIndex!].efficiency + "%"
                cell.imageView.image = #imageLiteral(resourceName: "efficiency.jpeg")
            }
        else if indexPath.row == 1 {
                cell.titleLabel.text = arrayOfTitles[1]
                cell.numberLabel.text = users[selectedIndex!].startTime
                cell.imageView.image = #imageLiteral(resourceName: "startTime.png")
            }
        else if indexPath.row == 2 {
                cell.titleLabel.text = arrayOfTitles[2]
                cell.numberLabel.text = users[selectedIndex!].duration
                cell.imageView.image = #imageLiteral(resourceName: "duration.jpeg")
            }
        else if indexPath.row ==  3 {
                cell.titleLabel.text = arrayOfTitles[3]
                cell.numberLabel.text = users[selectedIndex!].minutesToFallAsleep
                cell.imageView.image = #imageLiteral(resourceName: "minutestofallasleep.png")
            }
        else if indexPath.row ==  4 {
            cell.titleLabel.text = arrayOfTitles[4]
            cell.numberLabel.text = users[selectedIndex!].minutesAsleep
            cell.imageView.image = #imageLiteral(resourceName: "minutesAsleep.png")
        }
        else if indexPath.row ==  5 {
            cell.titleLabel.text = arrayOfTitles[5]
            cell.numberLabel.text = users[selectedIndex!].minutesAwake
            cell.imageView.image = #imageLiteral(resourceName: "minutesAwake.png")
        }
        else if indexPath.row ==  6 {
            cell.titleLabel.text = arrayOfTitles[6]
            cell.numberLabel.text = users[selectedIndex!].awakeCount
            cell.imageView.image = #imageLiteral(resourceName: "awakeCount.png")
        }
        else if indexPath.row ==  7 {
            cell.titleLabel.text = arrayOfTitles[7]
            cell.numberLabel.text = users[selectedIndex!].awakeDuration
            cell.imageView.image = #imageLiteral(resourceName: "awakeduration.png")
        }
        else if indexPath.row ==  8 {
            cell.titleLabel.text = arrayOfTitles[8]
            cell.numberLabel.text = users[selectedIndex!].restlessCount
            cell.imageView.image = #imageLiteral(resourceName: "restlessCount.png")
        }
        else if indexPath.row ==  9 {
            cell.titleLabel.text = arrayOfTitles[9]
            cell.numberLabel.text = users[selectedIndex!].restlessDuration
            cell.imageView.image = #imageLiteral(resourceName: "restlessDuration.png")
        }
        else if indexPath.row ==  10 {
            cell.titleLabel.text = arrayOfTitles[10]
            cell.numberLabel.text = users[selectedIndex!].timeInBed
            cell.imageView.image = #imageLiteral(resourceName: "timeInBed.png")
        }
        return cell
    }
    
 /*   func setChart(dataPoints: [String], values: [Double]) {
        var dataEntries = [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: user.minuteData["value"][i], yValues: user.minuteData["dateTime"][i], label: "Date Time")
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Date Time")
        let chartData = BarChartData(xVals: user.minuteData["value"], dataSet: chartDataSet)
        barChartView.data = chartData
    }
    
*/

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        let detailedItem = segue.destination as! IndividualNoteViewController
        detailedItem.selectedIndex = selectedIndex
    
    }
   
}

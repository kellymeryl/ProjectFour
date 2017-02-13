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
    
    @IBOutlet weak var barChartView: BarChartView!
    
    var individualViewController: IndividualNoteViewController?
    var selectedIndex: Int?
    
    var user: UserSleep!
    
    var arrayOfTitles = ["Efficiency", "Start Time", "Duration", "Minutes To Sleep", "Minutes Asleep", "Minutes Awake", "Awake Count", "Awake Duration", "Restless Duration", "Time In Bed"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let floatNumb: CGFloat = 5.0
        
        user = users[selectedIndex!]
        dateLabel.text! = user.startTime
        collectionView.layer.borderWidth = 1
        collectionView.layer.borderColor = UIColor.white.cgColor
        collectionView.layer.cornerRadius = floatNumb
        
        barChartView.noDataText = "You need to provide data for the chart."
        
        setChart()
        
        
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SleepAnalysisCollectionViewCell", for: indexPath) as! SleepAnalysisCollectionViewCell
        let cornerRadius : CGFloat = 5.0
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.cornerRadius = cornerRadius
        cell.layer.borderWidth = 1

        
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
                let duration = users[selectedIndex!].duration
                let durationVar = Double(duration)
                let durationFormatted = Double((durationVar! / 1000) * 0.000277778)
                let durationLabelText = String(format: "%.2f", durationFormatted) + " hrs"
                cell.numberLabel.text = durationLabelText
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
            cell.numberLabel.text = users[selectedIndex!].restlessDuration
            cell.imageView.image = #imageLiteral(resourceName: "restlessDuration.png")
        }
        else if indexPath.row ==  9 {
            cell.titleLabel.text = arrayOfTitles[9]
            let timeInBed = Double(users[selectedIndex!].timeInBed)
            let timeInBedHours = timeInBed! / 60
            let timeInBedString = String(timeInBedHours)
            cell.numberLabel.text = timeInBedString + " hrs"
            cell.imageView.image = #imageLiteral(resourceName: "timeInBed.png")
        }
        return cell
    }
    
    func setChart() {
        var dataEntries: [BarChartDataEntry] = []
        
        var yValues = [0.0]
        var x = 0
        
        while x < user.minuteData.count {
            let minuteDataString = user.minuteData[x]["value"] as! String
            let yvalNumb = minuteDataString.numberValue
            yValues.append(Double(yvalNumb!))
            
            x += 1
        }
        
        var xValues : [String] = []
        var y = 0
        
        while y < user.minuteData.count {
            let minuteDataString = user.minuteData[y]["dateTime"] as! String
       //     let xValNumb = minuteDataString.numberValue
            xValues.append(minuteDataString)
            y += 1
        }
        
        var xVals = ["Awake", "Restless", "Sleeping"]
        
        for i in 0..<user.minuteData.count - 1 {
            let dataEntry = BarChartDataEntry(x: Double(i), yValues: [yValues[i]], label: xVals[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Sleep Cycles")
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
        
        
        barChartView.chartDescription?.text = ""
      //  barChartView.
        chartDataSet.colors = ChartColorTemplates.colorful()
        barChartView.xAxis.labelPosition = .bottom

        
    }
    

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        let detailedItem = segue.destination as! IndividualNoteViewController
        detailedItem.selectedIndex = selectedIndex
    }
   
}

extension String {
    var numberValue:NSNumber? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.number(from: self)
    }    }

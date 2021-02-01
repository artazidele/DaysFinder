//
//  ViewController.swift
//  DaysFinder
//
//  Created by arta.zidele on 01/02/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var findButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ViewController first lunch")
    }
    
    @IBAction func findWeekDayTapped(_ sender: Any) {
        let dayStart = dayTextField.text
        let monthStart = monthTextField.text
        let year = yearTextField.text!
        let calendar = Calendar.current
        
        let dayInt = Int(dayStart!)
        let monthInt = Int(monthStart!)
        var day = ""
        var month = ""
        if dayInt! < 10 {
            day = "0" + dayStart!
        } else {
            day = dayStart!
        }
        if monthInt! < 10 {
            month = "0" + monthStart!
        } else {
            month = monthStart!
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let knownDay = "01.02.2021"
        let unknownDay = "\(day).\(month).\(year)"
        //let unknownDay = "02.02.2021"
        let knownDate = formatter.date(from: knownDay) ?? Date()
        let unknownDate = formatter.date(from: unknownDay) ?? Date()
        
        let daysBetween = calendar.dateComponents([.day], from: unknownDate, to: knownDate).day
        if daysBetween! % 7 == 1 {
            print(resultLabel.text = "Tuesday")
        } else if daysBetween! % 7 == 2{
            resultLabel.text = "Wednesday"
        } else if daysBetween! % 7 == 3{
            resultLabel.text = "Thursday"
        } else if daysBetween! % 7 == 4{
            resultLabel.text = "Friday"
        } else if daysBetween! % 7 == 5{
            resultLabel.text = "Saturday"
        } else if daysBetween! % 7 == 6{
            resultLabel.text = "Sunday"
        } else if daysBetween! % 7 == 0{
            resultLabel.text = "Monday"
        }
        
        
    }
    

}


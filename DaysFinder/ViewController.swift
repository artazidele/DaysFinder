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
    
    @IBOutlet weak var addReminder: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ViewController first lunch")
    }
    
    @IBAction func findWeekDayTapped(_ sender: Any) {
        /*
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
        let knownDate = formatter.date(from: knownDay) ?? Date()
        let unknownDate = formatter.date(from: unknownDay) ?? Date()
        
        let daysBetween = calendar.dateComponents([.day], from: unknownDate, to: knownDate).day
        if daysBetween! % 7 == -1 || daysBetween! % 7 == 6 {
            print(resultLabel.text = "Tuesday")
        } else if daysBetween! % 7 == -2 || daysBetween! % 7 == 5 {
            resultLabel.text = "Wednesday"
        } else if daysBetween! % 7 == -3 || daysBetween! % 7 == 4 {
            resultLabel.text = "Thursday"
        } else if daysBetween! % 7 == -4 || daysBetween! % 7 == 3 {
            resultLabel.text = "Friday"
        } else if daysBetween! % 7 == -5 || daysBetween! % 7 == 2 {
            resultLabel.text = "Saturday"
        } else if daysBetween! % 7 == -6 || daysBetween! % 7 == 1 {
            resultLabel.text = "Sunday"
        } else if daysBetween! % 7 == 0{
            resultLabel.text = "Monday"
        }
        */
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        guard let day = Int(dayTextField.text!), let month = Int(monthTextField.text!), let year = Int(yearTextField.text!) else {
            warningPopup(withTitle: "Input Error", withMessage: "Please enter the correct Date.")
            return
        }
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        guard let date = calendar.date(from: dateComponents) else {return}
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_En")
        dateFormatter.dateFormat = "EEEE"
        switch findButton.titleLabel?.text {
        case "Find":
            findButton.setTitle("Clear", for: .normal)
            if day >= 1 && day <= 31 && month >= 1 && month <= 12 {
                let weekday = dateFormatter.string(from: date)
                let capitalizedWeekday = weekday.capitalized
                resultLabel.text = capitalizedWeekday
                addReminder.isHidden = false
            } else {
                warningPopup(withTitle: "Wrong Date!", withMessage: "Please enter the correct Date!")
            }
        default:
        findButton.setTitle("Find", for: .normal)
        clearAllTextFields()
            addReminder.isHidden = true
        }
    }
    
    func clearAllTextFields() {
        dayTextField.text = ""
        monthTextField.text = ""
        yearTextField.text = ""
        resultLabel.text = "Day of the week, inside Your finder"
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func warningPopup(withTitle title: String?, withMessage message: String?) {
        let popUp = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        popUp.addAction(okButton)
        self.present(popUp, animated: true, completion: nil)
        
    }
    
    @IBAction func reminder(_ sender: Any) {
        openReminders()
    }
    func openReminders() {
        if UIApplication.shared.canOpenURL(URL(string:"x-apple-reminderkit://")!) {
            UIApplication.shared.open(URL(string: "x-apple-reminderkit://")!) { (success) in
                print("open: ", success)
            }
        }
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dayFinder" {
            // Get the new view controller using segue.destination.
            let vc = segue.destination as! AppInfoViewController
            // Pass the selected object to the new view controller.
            vc.infoText = "DayFinder helps to find exact weekday for given date."
        }
    }
    

}


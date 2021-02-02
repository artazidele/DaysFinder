//
//  AppearanceViewController.swift
//  DaysFinder
//
//  Created by arta.zidele on 02/02/2021.
//

import UIKit

class AppearanceViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func openSettingsButtonTapped(_ sender: Any) {
        openSettings()
    }
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func setLabelText() {
        var text = "Unable to specify UI Style"
        if self.traitCollection.userInterfaceStyle == .dark {
            text = "Dark Mode is on. \n Go to settings if you would like \n to change to Light Mode"
        } else {
            text = "Light Mode is on. \n Go to settings if you would like \n to change to Dark Mode"
        }
        textLabel.text = text
    }
    func openSettings() {
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        if UIApplication.shared.canOpenURL(settingsURL) {
            UIApplication.shared.open(settingsURL, options: [:]) { (success) in
                print("open: ", success)
            }
        }
    }
    
    



}

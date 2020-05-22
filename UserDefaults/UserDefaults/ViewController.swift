//
//  ViewController.swift
//  UserDefaults
//
//  Created by Richard Cho on 2020-05-22.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var bluetoothSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        if defaults.object(forKey: Constants.UserDefaults.bluetoothSwitch) != nil {
            bluetoothSwitch.isOn = defaults.bool(forKey: Constants.UserDefaults.bluetoothSwitch)
        }
        
    }
    
    @IBAction func saveSwitchState(_ sender: UISwitch) {
        // save the state of the switch
        // -> "UserDefaults"
        
        // 1. get the userDefaults object
        let defaults = UserDefaults.standard
        
        // 2. save the state
//        if sender.isOn {
//            defaults.set(true, forKey: "switch")
//        } else {
//            defaults.set(false, forKey: "switch")
//        }
        defaults.set(sender.isOn, forKey: Constants.UserDefaults.bluetoothSwitch)
    }
    
}


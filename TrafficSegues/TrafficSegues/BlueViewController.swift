//
//  BlueViewController.swift
//  TrafficSegues
//
//  Created by Richard Cho on 2020-04-20.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == "unwindToRed" {
            switch identifier {
            case "unwindToRed":
                if let destinationVC = segue.destination as? ViewController {
                    // do the same as forward segue
                }
            case "GoToPurple":
                print("prepareForPurple")
            case "GoToOrange":
                print("prepareForPurple")
            default:
                fatalError("Wrong segue identifier")
            }
        }
    }
    
    @IBAction func purpleButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "GoToPurple", sender: sender)
    }
    
    @IBAction func orangeButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "GoToOrange", sender: sender)
    }
}

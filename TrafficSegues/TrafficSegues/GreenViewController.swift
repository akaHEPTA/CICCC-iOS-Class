//
//  GreenViewController.swift
//  TrafficSegues
//
//  Created by Richard Cho on 2020-04-20.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController {
    
    // dependency injection
    var user: User! // implicitly unwrapped optional ("there will be an user! 100%")
    
    @IBOutlet var userInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "\(user.name), \(user.hobby)"
        userInfoLabel.text = "\(user.name), \(user.hobby)"
//        print(user.name)
//        print(user.hobby)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
}

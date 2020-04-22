//
//  GoViewController.swift
//  RainbowTabs
//
//  Created by Richard Cho on 2020-04-22.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class GoViewController: UIViewController {

    var color: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .cyan
        navigationItem.title = "from \(color!)"
    }
    
}

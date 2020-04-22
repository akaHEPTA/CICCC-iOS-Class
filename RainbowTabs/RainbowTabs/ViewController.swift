//
//  ViewController.swift
//  RainbowTabs
//
//  Created by Richard Cho on 2020-04-22.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let centerBtn = CenterButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Red"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        
        view.backgroundColor = .red
        view.addSubview(centerBtn)
        
        centerBtn.addTarget(self, action: #selector(goToNextViewController), for: .touchUpInside)
        centerBtn.centerInSuperView()
    }

    @objc func goToNextViewController(_ sender: UIButton) {
        // Go to GoViewController
        let goVC = GoViewController()
        goVC.color = navigationItem.title!
        navigationController?.pushViewController(goVC, animated: true)
    }
    
}

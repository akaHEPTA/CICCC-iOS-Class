//
//  ViewController.swift
//  Hello
//
//  Created by Richard Cho on 2020-04-14.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var myButton: UIButton! // Implecity unwrapped
    private let nameLable: UILabel = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Initialize properties (subviews or view itself)
        // view.backgroundColor = .red
        myButton.setTitle("YES!", for: .normal)
        view.addSubview(nameLable);
        nameLable.text = "Hello"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        print("Button tapped!")
    }
    
}


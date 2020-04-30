//
//  DetailViewController.swift
//  EmojiDictionary
//
//  Created by Derrick Park on 4/29/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet var idImageView: UIImageView!
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var positionLabel: UILabel!
  
  var employee: Employee!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    idImageView.image = UIImage(named: employee.image)
    nameLabel.text = employee.name
    positionLabel.text = employee.position
  }
  
}

//
//  DetailViewController.swift
//  TableViewDemoCode
//
//  Created by Derrick Park on 5/1/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  var name: String! {
    didSet {
      updateUI(name)
    }
  }
  
  let nameLabel: UILabel = {
    let lb = UILabel()
    lb.translatesAutoresizingMaskIntoConstraints = false
    lb.font = UIFont.boldSystemFont(ofSize: 50)
    return lb
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(nameLabel)
    nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
  }
  
  fileprivate func updateUI(_ name: String) {
    navigationItem.title = name
    nameLabel.text = name
  }
  
}

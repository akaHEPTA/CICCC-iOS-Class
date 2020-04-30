//
//  ViewController.swift
//  EmojiDictionary
//
//  Created by Derrick Park on 4/29/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

struct Employee {
  let image: String
  let name: String
  let position: String
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  private let cellId = "Name Cell"
  
  @IBOutlet var tableView: UITableView!
  
  let names = ["Aaron", "Diego", "Naoki", "Richard",
               "Kaden", "Andre", "Carlos", "Vlad",
               "Yuka", "Mika", "Yusuke", "Shohei",
               "Hotsuma", "Rick", "Wenda", "Daniel",
               "Douglas"]
  
  let positions = ["Professional Clown", "Software Developer", "Designer", "Animal Trainer", "Uber Driver"]
  let images = ["clown", "software", "designer", "animal", "uber"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // data source - data
    // delegate - actions
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return names.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // 1. ask for the cell (dequeue some reusable cell for me)
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
    cell.textLabel?.text = names[indexPath.row]
    cell.detailTextLabel?.text = positions[indexPath.row % positions.count]
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "Detail", sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let identifier = segue.identifier, identifier == "Detail" {
      let destVC = segue.destination as! DetailViewController
      if let indexPath = tableView.indexPathForSelectedRow {
        destVC.employee = Employee(image: images[indexPath.row % positions.count], name: names[indexPath.row], position: positions[indexPath.row % positions.count])
      }
    }
  }
}


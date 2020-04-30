//
//  AddEmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Derrick Park on 4/30/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class AddEmojiTableViewController: UITableViewController {
  
  @IBOutlet var symbolTextField: UITextField!
  @IBOutlet var nameTextField: UITextField!
  @IBOutlet var descriptionTextField: UITextField!
  @IBOutlet var usageTextField: UITextField!
  @IBOutlet var saveButton: UIBarButtonItem!
  
  static let unwindSegueId = "saveUnwind"
  var emoji: Emoji?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let emoji = emoji {
      // edit
      symbolTextField.text = emoji.symbol
      nameTextField.text = emoji.name
      descriptionTextField.text = emoji.description
      usageTextField.text = emoji.usage
    }
    
    validateTextFields()
  }
  
  // 1. validate user input
  private func validateTextFields() {
    let symbol = symbolTextField.text ?? ""
    let name = nameTextField.text ?? ""
    let description = descriptionTextField.text ?? ""
    let usage = usageTextField.text ?? ""
    
    saveButton.isEnabled = !symbol.isEmpty && !name.isEmpty && !description.isEmpty && !usage.isEmpty
  }
  
  // 2. prepare for unwind segue (pass the data)
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == AddEmojiTableViewController.unwindSegueId {
      let symbol = symbolTextField.text ?? ""
      let name = nameTextField.text ?? ""
      let description = descriptionTextField.text ?? ""
      let usage = usageTextField.text ?? ""
      emoji = Emoji(symbol: symbol, name: name, description: description, usage: usage)
    }
  }
  
  @IBAction func textEditingChanged(_ sender: UITextField) {
    validateTextFields()
  }
  
  @IBAction func returnKeyPressed(_ sender: UITextField) {
    sender.resignFirstResponder()
  }
  
  @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
    dismiss(animated: true, completion: nil)
  }
  
}

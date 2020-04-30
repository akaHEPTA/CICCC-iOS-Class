//
//  EmojiTableViewCell.swift
//  EmojiDictionary
//
//  Created by Derrick Park on 4/30/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {
  @IBOutlet var symbolLabel: UILabel!
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var descriptionLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  func updateUI(with emoji: Emoji) {
    symbolLabel.text = emoji.symbol
    nameLabel.text = emoji.name
    descriptionLabel.text = emoji.description
  }
}

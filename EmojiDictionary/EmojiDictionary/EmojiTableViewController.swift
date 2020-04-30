//
//  EmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Derrick Park on 4/30/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {
  struct SegueIdentifier {
    static let addEmoji = "AddEmoji"
    static let editEmoji = "EditEmoji"
  }
  
  private let cellId = "EmojiCell"
  
  var emojis: [Emoji] = [
    Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
    Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
    Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
    Emoji(symbol: "👮‍♂️", name: "Police Officer", description: "A police officer wearing a blue cap with a gold badge.", usage: "person of authority"),
    Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"),
    Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.leftBarButtonItem = editButtonItem
  }
  
  override func setEditing(_ editing: Bool, animated: Bool) {
    super.setEditing(editing, animated: animated)
    //    print(editing)
    //    print(tableView.isEditing)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == SegueIdentifier.editEmoji {
      // where I tapped (indexPath)
      let indexPath = tableView.indexPathForSelectedRow!
      // get the emoji info
      let emoji = emojis[indexPath.row]
      // pass to AddEmoji
      let navController = segue.destination as! UINavigationController
      let addEmojiTVC = navController.topViewController as! AddEmojiTableViewController
      addEmojiTVC.emoji = emoji
    }
  }
  
  @IBAction func unwindToEmojiTableView(segue: UIStoryboardSegue) {
    if segue.identifier == AddEmojiTableViewController.unwindSegueId {
      let sourceVC = segue.source as! AddEmojiTableViewController
      if let emoji = sourceVC.emoji {
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
          // edit
          emojis[selectedIndexPath.row] = emoji
          tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
        } else {
          // add
          emojis.append(emoji)
          tableView.insertRows(at: [IndexPath(row: emojis.count - 1, section: 0)], with: .automatic)
        }
      }
    }
  }
  
  // MARK: - table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return emojis.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // 1. dequeue reusable cell
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! EmojiTableViewCell
    
    // 2. configure the cell
    let emoji = emojis[indexPath.row]
    cell.updateUI(with: emoji)
    
    // 3. return the cell
    return cell
  }
  
  // MARK: - table view delegate
  
  /// Enables swipe to delete
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      // update the model
      emojis.remove(at: indexPath.row)
      // update the tableview
      tableView.deleteRows(at: [indexPath], with: .automatic)
    }
  }
  
  /// Defines left buttons when in editting mode
  override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    return .delete
  }
  
  override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    let emojiToMove = emojis.remove(at: sourceIndexPath.row)
    emojis.insert(emojiToMove, at: destinationIndexPath.row)
  }
  
  /// Custom row editting buttons
//  override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//    return UISwipeActionsConfiguration(actions: [
//      UIContextualAction(style: .destructive, title: "Remove", handler: { [weak self] (action, view, handler)  in
//        // update the model
//        self?.emojis.remove(at: indexPath.row)
//        // update the tableview
//        tableView.deleteRows(at: [indexPath], with: .automatic)
//      }),
//      UIContextualAction(style: .normal, title: "Edit", handler: { (action, view, handler) in
//        print("Edit")
//      })
//    ])
//  }
}

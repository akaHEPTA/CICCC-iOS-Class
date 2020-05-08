//
//  NotesViewController.swift
//  ProtocolPersistence
//
//  Created by Richard Cho on 2020-05-05.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

struct Note: Codable {
    let title: String
    let text: String
    let timestamp: Date
}

class NotesViewController: UITableViewController {
    
    var notes: [Note] = []
    
    private let archiveURL: URL = {
        // 1. access to Documents directory using FileManager
        // FileManager.default (Singleton object)
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(SubTitleCell.self, forCellReuseIdentifier: "NoteCell")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNote))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNotes))
        
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedNoteData = try? Data(contentsOf: archiveURL) { // read contents of url
            if let decodedNotes = try? propertyListDecoder.decode([Note].self, from: retrievedNoteData) {
                notes = decodedNotes
                print(decodedNotes)
            }
        }
    }
    
    @objc func addNote(_ sender: UIBarButtonItem) {
        let newNote = Note(title: "Grocery Run", text: "Pick up some coconut water", timestamp: Date())
        notes.append(newNote)
        tableView.insertRows(at: [IndexPath(row: notes.count - 1, section: 0)], with: .automatic)
    }
    
    @objc func saveNotes(_ sender: UIBarButtonItem) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedNote = try? propertyListEncoder.encode(notes)
        try? encodedNote?.write(to: archiveURL, options: .noFileProtection)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        let note = notes[indexPath.row]
        cell.textLabel?.text = note.title
        cell.detailTextLabel?.text = note.timestamp.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
}

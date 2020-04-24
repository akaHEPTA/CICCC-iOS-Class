//
//  ViewController.swift
//  NotificationDemo
//
//  Created by Richard Cho on 2020-04-24.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var amountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountTextField.delegate = self
        
        // Add observers to NotificationCenter
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func dismissKeyboard(_ recognizer: UITapGestureRecognizer) {
        amountTextField.resignFirstResponder()
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        // change the view frame (y) (moves up)
        // 1. get the keyboard size (height)
        // 2. change view.frame.origin.y
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                view.frame.origin.y -= (keyboardSize.height) / 2
            }
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y != 0 {
                // view.frame.origin.y = 0
                view.frame.origin.y += (keyboardSize.height) / 2
            }
        }
    }
    
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


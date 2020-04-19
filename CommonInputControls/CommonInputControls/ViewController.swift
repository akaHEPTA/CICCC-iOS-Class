//
//  ViewController.swift
//  CommonInputControls
//
//  Created by Richard Cho on 2020-04-17.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var toggle: UISwitch!
    @IBOutlet var slider: UISlider!
    @IBOutlet var nameField: UITextField!
    
    let moneyButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .blue
        btn.setTitle("🤑", for: .normal)
        NSLayoutConstraint.activate([
            btn.widthAnchor.constraint(equalToConstant: 100),
            btn.heightAnchor.constraint(equalToConstant: 100)
        ])
        return btn
    }() // closure - immediately invoked function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(moneyButton)
        moneyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        moneyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64).isActive = true
        moneyButton.addTarget(self, action: #selector(moneyButtonTapped), for: .touchUpInside)
        
        let tapGesture = UIPanGestureRecognizer(target: self, action: #selector(tapRecognized))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func moneyButtonTapped(_ sender: UIButton) {
        print("Get money 💰")
    }
    
    @objc func tapRecognized(_ recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .changed:
            print(recognizer.translation(in: view))
        default:
            break
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        nameField.resignFirstResponder()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        print("Button was tapped!")
        if toggle.isOn {
            print("toggle on!")
        } else {
            print("toggle off!")
        }
        print("the slider is set to \(slider.value)")
        print("the name is \(nameField.text!)")
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        if sender.isOn {
            print("The switch is on!")
        } else {
            print("The switch is off!")
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
    }
    
    @IBAction func keyboardReturnKeyTapped(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        }
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        }
    }
    
}


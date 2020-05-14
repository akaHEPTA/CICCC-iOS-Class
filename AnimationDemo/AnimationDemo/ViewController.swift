//
//  ViewController.swift
//  AnimationDemo
//
//  Created by Richard Cho on 2020-05-12.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        example5()
    }
    
    /// Change the background color of the square view
    func example1() {
        let square = UIView(frame: .init(x: 0, y: 44, width: 100, height: 100))
        square.backgroundColor = .purple
        view.addSubview(square)
        UIView.animate(withDuration: 3.0) {
            square.backgroundColor = .orange
        }
    }
    
    /// Make the square larger and move it to the center of the view
    func example2() {
        let square = UIView(frame: .init(x: 0, y: 44, width: 100, height: 100))
        square.backgroundColor = .purple
        view.addSubview(square)
        UIView.animate(withDuration: 3.0) {
            square.backgroundColor = .orange
            square.frame = .init(x: self.view.frame.size.width / 2 - 100, y: self.view.frame.size.height / 2 - 100, width: 200, height: 200)
        }
    }
    
    /// Make the square view larger and move it to the center of the view, and then move back to the original position
    func example3() {
        let originalFrame = CGRect(x: 0, y: 44, width: 100, height: 100)
        let square = UIView(frame: originalFrame)
        square.backgroundColor = .purple
        view.addSubview(square)
        UIView.animate(withDuration: 3.0, animations: {
            square.backgroundColor = .orange
            square.frame = .init(x: self.view.frame.size.width / 2 - 100, y: self.view.frame.size.height / 2 - 100, width: 200, height: 200)
        }) { (_) in
            UIView.animate(withDuration: 3.0) {
                square.backgroundColor = .purple
                square.frame = originalFrame
            }
        }
    }
    
    /// Move the square from the top-left corner to the bottom-right corner over three seconds
    /// after three seconds after a two-second delay, and repeats the animation indefinitely with no completion closure
    func example4() {
        let originalFrame = CGRect(x: 0, y: 44, width: 100, height: 100)
        let square = UIView(frame: originalFrame)
        square.backgroundColor = .purple
        square.alpha = 0
        view.addSubview(square)
        UIView.animate(withDuration: 3.0, delay: 2.0, options: [.repeat], animations: {
            square.backgroundColor = .orange
            square.alpha = 1.0
            square.frame = .init(x: self.view.frame.size.width - 200, y: self.view.frame.size.height - 200, width: 200, height: 200)
        }, completion: nil)
    }
    
    func example5() {
        let originalFrame = CGRect(x: 0, y: 44, width: 100, height: 100)
        let square = UIView(frame: originalFrame)
        square.backgroundColor = .purple
        UIView.animate(withDuration: 2.0, animations: {
            let scaleTransform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            let rotationTransform = CGAffineTransform(rotationAngle: .pi) // Maximum -> .pi (if you want more, use concatenate)
            let translateTransform = CGAffineTransform(translationX: self.view.frame.size.width / 2 - 100, y: self.view.frame.size.height / 2 - 100)
            square.transform = scaleTransform.concatenating(rotationTransform).concatenating(translateTransform)
        }) { (_) in
            UIView.animate(withDuration: 2.0) {
                square.transform = .identity
            }
        }
    }
}


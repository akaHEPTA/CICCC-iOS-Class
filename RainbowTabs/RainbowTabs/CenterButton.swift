//
//  CenterButton.swift
//  RainbowTabs
//
//  Created by Richard Cho on 2020-04-22.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class CenterButton: UIButton {

    // Designated initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // Convenience initializer
    convenience init() {
        self.init(frame: .zero) // .zero == CGRect.zero
        self.setTitle("Go!", for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

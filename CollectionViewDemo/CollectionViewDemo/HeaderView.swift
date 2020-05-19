//
//  HeaderView.swift
//  CollectionViewDemo
//
//  Created by Richard Cho on 2020-05-19.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    let textLabel : UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textAlignment = .center
        lb.textColor = .white
        lb.font = UIFont.boldSystemFont(ofSize: 30)
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .cyan
        textLabel.text = "MicroSoft!"
        addSubview(textLabel)
        textLabel.matchParent(padding: .init(top: 8, left: 8, bottom: 8, right: 8))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

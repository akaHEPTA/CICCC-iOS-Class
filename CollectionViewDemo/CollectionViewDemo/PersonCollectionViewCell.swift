//
//  PersonCollectionViewCell.swift
//  CollectionViewDemo
//
//  Created by Richard Cho on 2020-05-19.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class PersonCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        imageView.matchParent()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}

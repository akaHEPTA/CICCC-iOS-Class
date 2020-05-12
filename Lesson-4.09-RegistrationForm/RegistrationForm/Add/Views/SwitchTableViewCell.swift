//
//  SwitchTableViewCell.swift
//  RegistrationForm
//
//  Created by Richard Cho on 2020-05-11.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class SwitchUITableViewCell: UITableViewCell {

    private let categoryLabel: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return lb
    }()
    
    private let priceLabel: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.setContentHuggingPriority(.required, for: .horizontal) // required > defaultHigh
        return lb
    }()
    
    private let switchControl: UISwitch = {
        let sp = UISwitch()
        sp.translatesAutoresizingMaskIntoConstraints = false
        return sp
    }()
    
    var isOn: Bool {
        return switchControl.isOn
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    convenience init(category: String, price: Int) {
        self.init()
        categoryLabel.text = category
        priceLabel.text = "$ \(price)"
        let hs = HorizontalStackView(arrangedSubviews: [categoryLabel, priceLabel, switchControl], spacing: 15, alignment: .center, distribution: .fill)
        hs.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(hs)
        hs.anchors(
            topAnchor: contentView.topAnchor,
            leadingAnchor: contentView.leadingAnchor,
            trailingAnchor: contentView.trailingAnchor,
            bottomAnchor: contentView.bottomAnchor,
            padding: .init(top: 5, left: 16, bottom: 5, right: 16)
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

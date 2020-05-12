//
//  DateLabelTableViewCell.swift
//  RegistrationForm
//
//  Created by Richard Cho on 2020-05-11.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class DateLabelTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    convenience init(title: String) {
        self.init(style: .value1, reuseIdentifier: nil)
        textLabel?.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

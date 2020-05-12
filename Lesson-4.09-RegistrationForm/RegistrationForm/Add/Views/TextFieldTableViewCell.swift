//
//  TextFieldTableViewCell.swift
//  RegistrationForm
//
//  Created by Richard Cho on 2020-05-11.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {

    let textField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    var textStr: String? {
        return textField.text
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    convenience init(placeHolder: String) {
        self.init()
        contentView.addSubview(textField)
        textField.matchParent(padding: .init(top: 5, left: 16, bottom: 5, right: 16))
        textField.placeholder = placeHolder
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

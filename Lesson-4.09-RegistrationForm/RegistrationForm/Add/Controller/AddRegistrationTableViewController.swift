//
//  AddRegistrationTableViewController.swift
//  RegistrationForm
//
//  Created by Richard Cho on 2020-05-11.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController {
    
    private let firstNameCell = TextFieldTableViewCell(placeHolder: "First Name")
    private let lastNameCell = TextFieldTableViewCell(placeHolder: "Last Name")
    private let emailCell = TextFieldTableViewCell(placeHolder: "Email")
    
    private let checkInCell = DateLabelTableViewCell(title: "Check-In Date")
    private let checkInDatePickerCell = DatePickerTableViewCell()
    private let checkOutCell = DateLabelTableViewCell(title: "Check-Out Date")
    private let checkOutDatePickerCell = DatePickerTableViewCell()
    
    private let adultGuestCell = StepperTableViewCell(guestType: "Adults")
    private let childGuestCell = StepperTableViewCell(guestType: "Children")
    
    private let wifiCell = SwitchUITableViewCell(category: "Wi-Fi", price: Registration.wifiCost)
    
    private let roomTypeCell: RightDetailTableViewCell = {
        let cell = RightDetailTableViewCell(style: .value1, reuseIdentifier: nil)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = "Room Type"
        return cell
    }()
    
    //    lazy var cellForRowAt = [
    //        [firstNameCell, lastNameCell, emailCell],
    //        [checkInCell, checkInDatePickerCell, checkOutCell, checkOutDatePickerCell],
    //        [adultGuestCell, childGuestCell],
    //        [wifiCell],
    //        [roomTypeCell]
    //    ]
    
    private var isCheckInDatePickerShown: Bool = false {
        didSet {
            checkInDatePickerCell.datePicker.isHidden = !isCheckInDatePickerShown
        }
    }
    private var isCheckOutDatePickerShown: Bool  = false {
        didSet {
            checkOutDatePickerCell.datePicker.isHidden = !isCheckOutDatePickerShown
        }
    }
    
    private var roomType: RoomType?
    
    var addRegistration: ((Registration) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "New Guest Registration"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped(_:)))
        checkInDatePickerCell.datePickerValueChanged = { [unowned self] in self.updateDateViews() }
        checkOutDatePickerCell.datePickerValueChanged = { [unowned self] in self.updateDateViews() }
        updateDateViews()
        updateRoomType()
    }
    
    private func updateDateViews() {
        checkInDatePickerCell.datePicker.minimumDate = Date()
        checkOutDatePickerCell.datePicker.minimumDate = checkInDatePickerCell.datePicker.date.addingTimeInterval(86400) // 86400 seconds (24 hours)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        checkInCell.detailTextLabel?.text = dateFormatter.string(from: checkInDatePickerCell.datePicker.date)
        checkOutCell.detailTextLabel?.text = dateFormatter.string(from: checkOutDatePickerCell.datePicker.date)
    }
    
    private func updateRoomType() {
        if let roomType = self.roomType {
            roomTypeCell.detailTextLabel?.text = roomType.name
        } else {
            roomTypeCell.detailTextLabel?.text = "Not set"
        }
    }
    
    @objc func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func doneTapped(_ sender: UIBarButtonItem) {
        guard let roomType = roomType else {
            roomTypeCell.detailTextLabel?.textColor = .red
            return
        }
        
        let firstName = firstNameCell.textField.text ?? ""
        let lastName = lastNameCell.textField.text ?? ""
        let email = emailCell.textStr ?? ""
        let checkInDate = checkInDatePickerCell.datePicker.date
        let checkOutDate = checkOutDatePickerCell.datePicker.date
        let numberOfAdults = adultGuestCell.getNumberOfGuests
        let numberOfChildren = childGuestCell.getNumberOfGuests
        let hasWifi = wifiCell.isOn
        
        let registration = Registration(
            firstName: firstName,
            lastName: lastName,
            emailAdress: email,
            checkInDate: checkInDate,
            checkOutDate: checkOutDate,
            numberOfAdults: numberOfAdults,
            numberOfChildren: numberOfChildren,
            roomType: roomType,
            wifi: hasWifi
        )
        
        addRegistration?(registration)
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    private let numberOfRowsInSection = [3, 4, 2, 1, 1]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRowsInSection[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section, indexPath.row) {
        case (0, 0): return firstNameCell
        case (0, 1): return lastNameCell
        case (0, 2): return emailCell
        case (1, 0): return checkInCell
        case (1, 1): return checkInDatePickerCell
        case (1, 2): return checkOutCell
        case (1, 3): return checkOutDatePickerCell
        case (2, 0): return adultGuestCell
        case (2, 1): return childGuestCell
        case (3, 0): return wifiCell
        case (4, 0): return roomTypeCell
        default: return UITableViewCell()
        }
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section, indexPath.row) {
        case (1, 1):
            return isCheckInDatePickerShown ? 216 : 0
        case (1, 3):
            return isCheckOutDatePickerShown ? 216 : 0
        default:
            return 44
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch (indexPath.section, indexPath.row) {
        case (1, 0):
            if isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
            } else if isCheckOutDatePickerShown {
                isCheckInDatePickerShown = true
                isCheckOutDatePickerShown = false
            } else {
                isCheckInDatePickerShown = true
            }
        case (1, 2):
            if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
            } else if isCheckInDatePickerShown {
                isCheckOutDatePickerShown = true
                isCheckInDatePickerShown = false
            } else {
                isCheckOutDatePickerShown = true
            }
        case (4, 0):
            let selectRoomTVC = SelectRoomTypeTableViewController()
            selectRoomTVC.delegate = self
            selectRoomTVC.roomType = roomType
            navigationController?.pushViewController(selectRoomTVC, animated: true)
        default:
            break
        }
        /// Update the table view with a pair of beginUpdates and endUpdates calls.
        /// These calls tell the table view to re-query its attributes - including cell height
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}

extension AddRegistrationTableViewController: SelectRoomTypeTableViewControllerDelegate {
    
    func didSelect(roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
    }
}

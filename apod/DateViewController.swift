//
//  DateViewController.swift
//  apod
//
//  Created by Lindberg on 4/12/18.
//  Copyright © 2018 Lindberg. All rights reserved.
//

import UIKit
import Foundation

class DateViewController: UIViewController {

    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let newDate = dateFormatter.string(from: sender.date)
        appDelegate.selectedDate = newDate
    }
}

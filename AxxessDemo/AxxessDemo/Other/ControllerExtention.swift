//
//  ControllerExtention.swift
//  AxxessDemo
//
//  Created by Dhondge, Dipak on 8/04/20.
//  Copyright © 2020 Dhondge, Dipak. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

  func showAlert(withTitle title: String, message : String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: Constants.Alerts.okay, style: .default) { action in
    }
    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
  }
}

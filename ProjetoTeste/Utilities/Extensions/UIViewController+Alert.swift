//
//  UIViewController+Alert.swift
//  ProjetoTeste
//
//  Created by thaxz on 04/10/23.
//

import Foundation
import UIKit

// Extension to UIViewController providing a method to display a custom alert.

extension UIViewController {
    func displayAlert(message: String) {
        let alertController = UIAlertController(title: "Aviso",
                                                message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}


//
//
//  Alert.swift
//
//  Created by Satish Kumar on 19/07/19.
//  Copyright © 2019 Brillio Technologies. All rights reserved.


import Foundation
import UIKit

class Alert {
    
    class func showBasic(title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async {
            vc.present(alert, animated: true)
        }
        
    }
}

//
//
//
//  String+Extension.swift
//
//  Created by Satish Kumar on 19/07/19.
//  Copyright © 2019 Brillio Technologies. All rights reserved.


import Foundation

extension String {
    
    var isValidEmail: Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
    
}

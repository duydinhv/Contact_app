//
//  Validation.swift
//  Contact_app_withRealm
//
//  Created by DUY on 9/17/20.
//  Copyright © 2020 DUY. All rights reserved.
//

import Foundation
extension String {
    //To check phone text field is correct
    var isValidPhone: Bool {
        let phoneNumberRegex = "^[0-9+]{0,1}+[0-9]{9,16}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        let isValidPhone = phoneTest.evaluate(with: self)
        return isValidPhone
    }
    
    //To check mail text field is correct
    var isValidEmail: Bool {
       let regularExpressionForEmail = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let testEmail = NSPredicate(format:"SELF MATCHES %@", regularExpressionForEmail)
       return testEmail.evaluate(with: self)
    }
    
     //validate name
    var isValidName: Bool {
        let regularExpressionForName = "^[a-zA-Z0-9*-+@#$%^&*!~ ]{5,30}$"
        let testName = NSPredicate(format:"SELF MATCHES %@", regularExpressionForName)
        return testName.evaluate(with: self)
        
    }
    
    //validate name
    var isValidPosition: Bool {
        let regularExpressionForPosition = "^[a-zA-Z0-9 ]{5,30}$"
        let testPosition = NSPredicate(format:"SELF MATCHES %@", regularExpressionForPosition)
        return testPosition.evaluate(with: self)
    }
}


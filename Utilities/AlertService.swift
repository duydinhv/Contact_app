//
//  AlertService.swift
//  Contact_app_withRealm
//
//  Created by DUY on 9/17/20.
//  Copyright © 2020 DUY. All rights reserved.
//

import Foundation
import UIKit

class AlertService{
    
    private init() {}
    static func errorAlert(in vc: UIViewController, name: String){
        let alert = UIAlertController(title: "Error", message: "You have to input invalid \(name)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
        }))
        vc.present(alert,animated: true,completion: nil)
    }
}

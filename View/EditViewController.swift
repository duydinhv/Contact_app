//
//  editViewController.swift
//  Contact_app_withRealm
//
//  Created by DUY on 9/17/20.
//  Copyright © 2020 DUY. All rights reserved.
//

import UIKit
import RealmSwift

class EditViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var positionTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    var current:Contact!
    override func viewDidLoad() {
        super.viewDidLoad()
        show()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleSave))
    }
    
    @objc func show(){
        nameTextField.text = current.name
        positionTextField.text = current.position
        phoneTextField.text = current.phone
        emailTextField.text = current.email
    }
    
    @objc func handleSave(_ sender: UIBarButtonItem){
        let name = nameTextField?.text,
        phone = phoneTextField?.text,
        position = positionTextField?.text,
        email = emailTextField?.text
        
        let dict: [String: Any?] = ["name": name,
                                    "phone": phone,
                                    "email": email,
                                    "position": position]
        if(!name!.isValidName){
            AlertService.errorAlert(in: self, name: "name")
        }
        else if (!position!.isValidPosition){
            AlertService.errorAlert(in: self, name: "position")
        }
        else if(!email!.isValidEmail){
            AlertService.errorAlert(in: self, name: "mail")
        }
        else if(!phone!.isValidPhone){
            AlertService.errorAlert(in: self, name: "phone")
        }
        else{
        RealmService.shared.update(current, with: dict)
        }
        self.navigationController?.popViewController(animated: true)
    }
}

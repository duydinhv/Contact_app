//
//  addViewController.swift
//  Contact_app_withRealm
//
//  Created by DUY on 9/17/20.
//  Copyright © 2020 DUY. All rights reserved.
//

import UIKit


class AddViewController: UITableViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    //MARK: --PROPERTIES
   
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldMobile: UITextField!
    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var textFieldPosition: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    
    var currentContact:Contact!
    //MARK: --INIT
       override func viewDidLoad() {
           super.viewDidLoad()
    
           self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
           self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
            //Do any additional setup after loading the view.
       }
    
    //MARK: --HANDLE FUNCTION Delegate
    @objc func handleDone(_ sender: UIBarButtonItem){
        let name: String = textFieldName.text!,
        phone: String = textFieldMobile.text!,
        position: String = textFieldPosition.text!,
        email:String = textFieldEmail.text!
        self.currentContact = Contact(name: name, phone: phone, position: position, email: email)
        
        if(!name.isValidName){
            AlertService.errorAlert(in: self, name: "name")
        }
        else if (position.isValidPosition){
            AlertService.errorAlert(in: self, name: "position")
        }
        else if(!email.isValidEmail){
            AlertService.errorAlert(in: self, name: "mail")
        }
        else if(!phone.isValidPhone){
            AlertService.errorAlert(in: self, name: "phone")
        }
        else{
            RealmService.shared.create(currentContact)
        }
        self.navigationController?.popViewController(animated: true)
    }

    @objc func handleCancel(){
        self.navigationController?.popViewController(animated: true)
    }
}	

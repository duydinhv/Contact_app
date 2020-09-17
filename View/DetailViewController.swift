//
//  detailViewController.swift
//  Contact_app_withRealm
//
//  Created by DUY on 9/17/20.
//  Copyright © 2020 DUY. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    @IBOutlet var DetailTableView: UITableView!
    //MARK: -Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var phoneView: UIView!
    var currentContact: Contact!
    var textName = String() //declear to pass name person
    var textMobile = String()
    var textPosition = String()
    var textEmail = String()
    //MARK: -Init
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showInfor()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(handleEdit))
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(handleTap)) //declear tap view
        phoneView.addGestureRecognizer(tapGuesture)
    }
    //MARK: -Show information
    @objc func showInfor(){
       nameLabel?.text = currentContact.name
       positionLabel?.text = currentContact.position
       emailButton?.setTitle(currentContact.email, for: .normal)
       phoneLabel?.text = currentContact.phone
    }
    
    //MARK: -Call
    @objc func handleTap(_ sender: AnyObject){
        let alert = UIAlertController(title: "Call", message: "\(currentContact.name)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Call", style: .default, handler: {action in
            let number: NSURL = URL(string: "tel://" + "0935336719")! as NSURL
            UIApplication.shared.open(number as URL, options: [:], completionHandler: nil)
        }))
        present(alert,animated: true,completion: nil)
    }
    
    //MARK: -Switch to Edit view
    @objc func handleEdit(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.current = currentContact
        navigationController?.pushViewController(vc, animated: true)
        //present(UINavigationController(rootViewController: vc),animated: true)
    }
}


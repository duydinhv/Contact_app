//
//  ViewController.swift
//  Contact_app_withRealm
//
//  Created by DUY on 9/17/20.
//  Copyright © 2020 DUY. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    @IBOutlet var TableView: UITableView!

    var alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    var notificationToken: NotificationToken?
    //   var dbContact: DBManager! //create data manager
 
    var dataList : Results<Contact>!
    
    //MARK: -RELOAD TABLE
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.TableView.reloadData()
    }
    //MARK: -INIT
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = RealmService.shared.realm
        dataList = realm.objects(Contact.self)
            
        notificationToken = realm.observe { (notification, realm) in
            self.TableView.reloadData()
        }
        
        TableView.dataSource = self
            
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddContact))
        }
    
    //MARK: -AFTER DELETE REALM
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notificationToken?.invalidate()
        RealmService.shared.stopObservingErrors(in: self)
    }
    
    //MARK: -SWITCH TO ADD VIEW
    @objc func handleAddContact(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
}

    //MARK: -TABLE VIEW DELEGATE
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        vc.navigationItem.largeTitleDisplayMode = .never
        let person = dataList[indexPath.row]
        vc.currentContact = person
        navigationController?.pushViewController(vc, animated: true)
    }
}
    //MARK: -CREATE A TITLE
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.alphabet[section]
    }
    
    //MARK: -SHOW NUMBER OF SECTION
    func numberOfSections(in tableView: UITableView) -> Int {
        return alphabet.count
    }
        
    //MARK: -SHOW NUMBER OF ROW IN SECTION
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count;
    }
    
    //MARK: -DISPLAY A DATA IN TABLE VIEW
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! tableViewCell
        let currentPerson = dataList[indexPath.row]
        cell.configure(with: currentPerson)
        return cell
    }
    
    //MARK: -SWIPE TO DELETE CONTACT
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){(action,view,nil) in
            let currentPerson = self.dataList[indexPath.row]
            
            let alert = UIAlertController(title: "Delete contact", message: "Would you like to delete this contact?", preferredStyle: UIAlertController.Style.alert)

            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive, handler: {action in
                RealmService.shared.delete(currentPerson)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))

            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

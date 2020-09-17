//
//  Contact.swift
//  Contact_app_withRealm
//
//  Created by DUY on 9/17/20.
//  Copyright © 2020 DUY. All rights reserved.
//

import Foundation
import RealmSwift

class Contact: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var position: String = ""
    @objc dynamic var email: String = ""
    
    convenience init(name: String, phone: String, position: String, email: String) {
        self.init()
        self.name = name
        self.phone = phone
        self.position = position
        self.email = email
    }
}

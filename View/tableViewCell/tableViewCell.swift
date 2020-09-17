//
//  tableViewController.swift
//  Contact_app_withRealm
//
//  Created by DUY on 9/17/20.
//  Copyright © 2020 DUY. All rights reserved.
//

import UIKit

class tableViewCell: UITableViewCell {
    @IBOutlet var textName:UILabel!
    @IBOutlet var textPosition:UILabel!
    
    func configure(with contactLine: Contact) {
        textName.text = contactLine.name
        textPosition.text = contactLine.position
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

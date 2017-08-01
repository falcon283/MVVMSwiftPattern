//
//  UserCell.swift
//  MVVMKit
//
//  Created by FaLcON2 on 02/08/2017.
//  Copyright © 2017 Gabriele Trabucco. All rights reserved.
//

import UIKit
import MVVMKit

class UserCell : UITableViewCell, Contextable, View {
    var context: Any?
    
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var surnameLabel: UILabel?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        nameLabel?.text = nil
        surnameLabel?.text = nil
    }
}

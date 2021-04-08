//
//  ClientesTableViewCell.swift
//  companyApp
//
//  Created by Jonatan Wepsys on 4/7/21.
//

import UIKit

class ClientsTableViewCell: UITableViewCell {
    var action:  (() -> Void)?
    @IBOutlet weak var addressLbl: UILabel!
    
    @IBOutlet weak var nameLbl: UILabel!

    @IBOutlet weak var addressBtnPressed: UIButton!
    
    @IBAction func myAddresBtnPressed(_ sender: Any) {
        action?()

    }
}


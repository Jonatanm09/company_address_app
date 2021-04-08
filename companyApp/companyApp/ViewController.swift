//
//  ViewController.swift
//  companyApp
//
//  Created by Jonatan Wepsys on 4/7/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToClients", sender: self)
    }
    
}


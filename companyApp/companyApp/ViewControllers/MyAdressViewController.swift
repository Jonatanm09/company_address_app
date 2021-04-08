//
//  MyAdressViewController.swift
//  companyApp
//
//  Created by Jonatan Wepsys on 4/7/21.
//

import UIKit

class MyAdressViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var clientLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Vars
    var clients: Client = Client()
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        clientLbl.text = clients.name
        
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        clients.address.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myAddressCell", for: indexPath)  as! MyAddressTableViewCell
        let client = clients.address[indexPath.row]
        cell.addressLbl.text = client
        return cell
    }
}

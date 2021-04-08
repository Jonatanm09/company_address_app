//
//  ClientsViewController.swift
//  companyApp
//
//  Created by Jonatan Wepsys on 4/7/21.
//
import UIKit

class ClientsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    //MARK: Vars
    var clients: [Client] = []
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        clients =  Session.shared.client
        
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        clients =  Session.shared.client
        self.view.setNeedsLayout()
        tableView.reloadData()
    }
    
    @IBAction func addClientsPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToAddClient", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        clients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "clientsCell", for: indexPath)  as! ClientsTableViewCell
        let client = clients[indexPath.row]
        cell.nameLbl.text = client.name
        cell.addressLbl.text =  client.address.first
        cell.action = {
            self.goToMyAddressView(at: indexPath.row)
        }
        return cell
    }
    
    func goToMyAddressView(at index: Int){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MyAddressViewController") as? MyAdressViewController
        let curClient = clients[index]
        let client = clients.first { (clien) -> Bool in
            clien.id == curClient.id
        }
        vc?.clients = client!
        self.navigationController?.pushViewController(vc!, animated: true)

    }
    
}

//
//  AddClientViewController.swift
//  companyApp
//
//  Created by Jonatan Wepsys on 4/7/21.
//

import UIKit
import ProgressHUD


class AddClientViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var address: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addressTxt: UITextField!
    @IBOutlet weak var nameTxt: UITextField!
    var client: Client = Client()
    let identifier = UUID()
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
    }
    
    @IBAction func addAddressPressed(_ sender: Any) {
        address.append(self.addressTxt.text!)
        self.addressTxt.text = ""
        tableView.reloadData()
        
    }
    @IBAction func saveBtnPressed(_ sender: Any) {
        ProgressHUD.show()
        if address.isEmpty {
            guard !self.nameTxt.text!.isEmpty, !self.addressTxt.text!.isEmpty else {
                getAlert(message: "Todos los campos son obligatorios")
                return
            }
            client.address.append(self.addressTxt.text!)
        }
        else{
            guard !self.nameTxt.text!.isEmpty else {
                getAlert(message: "Todos los campos son obligatorios")
                return
            }
            for address in address {
                client.address.append(address)
            }
        }
        client.id = identifier
        client.name = self.nameTxt.text!
        Session.shared.client.append(client)
        ProgressHUD.dismiss()
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        address.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addressCell", for: indexPath)  as! AddressTableViewCell
        let addres = address[indexPath.row]
        cell.addressLbl.text = addres
        return cell
    }
    
    private func getAlert(message: String){
        let alert = UIAlertController(title: "Ha Ocurrido un Error!", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        ProgressHUD.dismiss()
    }
}



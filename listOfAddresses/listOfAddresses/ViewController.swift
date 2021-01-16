//
//  ViewController.swift
//  listOfAddresses
//
//  Created by Edgar Jr on 1/14/21.
//

import UIKit
import CoreData

class ViewController: UIViewController
{
    //var addresses: [NSManagedObject] = []
    var addresses: [String] = ["0", "1", "2"]
    @IBOutlet weak var addressTableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        guard let viewController2 = segue.destination as? ViewController2
        else
        {
            return
        }
        viewController2.delegate = self
    }
}

extension ViewController: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return addresses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellIdentifier = "fullAddressIdentifier"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FullAddressTableViewCell
        else
        {
            return UITableViewCell()
        }
        let address = addresses[indexPath.row]
        //cell.fullAddressLabel.text = address.value(forKeyPath: "address") as? String
        cell.fullAddressLabel.text = address
        return cell
    }
}

extension ViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let addressModel = addresses[indexPath.row]
        /*guard let addressName = addressModel.value(forKeyPath: "name") as? String, let address = addressModel.value(forKeyPath: "address") as? String
        else
        {
            return
        }
        let addressDetail = AddressModel(name: addressName, address: address)
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let addressDetailVC = storyboard.instantiateViewController(identifier: "ViewController2") as? ViewController2
        else
        {
            return
        }
        addressDetailVC.addressModel = addressDetail*/
        let addressDetail = AddressModel(name: addressModel, address: addressModel)
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let addressDetailVC = storyboard.instantiateViewController(identifier: "ViewController2") as? ViewController2
        else
        {
            return
        }
        addressDetailVC.addressModel = addressDetail
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            //let address = addresses[indexPath.row]
            //let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
            //let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            //context.delete(address)
            addresses.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            //try? context.save()
        }
    }
}

extension ViewController: ViewController2Delegate
{
    func addAddress()
    {
        let newAddress = addresses.count
        addresses.append("\(newAddress)")
        DispatchQueue.main.async
            {
                self.addressTableView.reloadData()
            }
        //addressTableView.reloadData()
    }
}

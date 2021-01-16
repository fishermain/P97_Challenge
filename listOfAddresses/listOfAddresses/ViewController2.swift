//
//  ViewController2.swift
//  listOfAddresses
//
//  Created by Edgar Jr on 1/14/21.
//

import UIKit
import CoreData
protocol ViewController2Delegate: class
{
    func addAddress()
}

class ViewController2: UIViewController
{
    @IBOutlet weak var addressImage: UIImageView!
    @IBOutlet weak var fullAddressLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var gymRestaurantSupermarketLabel: UILabel!
    @IBOutlet weak var addAddressButton: UIButton!
    var addressModel = AddressModel()
    weak var delegate: ViewController2Delegate?
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func addAddressButtonTapped(_ sender: UIButton)
    {
        saveAddress()
    }

    func saveAddress()
    {
        /*guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
        else
        {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "AddressObject", in: managedContext)
        else
        {
            return
        }
        let address = NSManagedObject(entity: entity, insertInto: managedContext)
        address.setValue(addressModel.name, forKey: "name")
        address.setValue(addressModel.address, forKey: "address")
        try? managedContext.save()*/
        delegate?.addAddress()
        dismiss(animated: true)
    }
}

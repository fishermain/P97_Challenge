//
//  FullAddressTableViewCell.swift
//  listOfAddresses
//
//  Created by Edgar Jr on 1/14/21.
//

import UIKit

class FullAddressTableViewCell: UITableViewCell
{
    @IBOutlet weak var fullAddressLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        selectionStyle = .none
    }
}

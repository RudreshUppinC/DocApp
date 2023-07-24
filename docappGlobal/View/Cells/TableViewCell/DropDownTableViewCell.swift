//
//  DropDownTableViewCell.swift
//  docappNew
//
//  Created by DarkMoon on 03/02/23.
//

import UIKit

class DropDownTableViewCell: UITableViewCell {
    static let identifier = String(describing: DropDownTableViewCell.self)

    @IBOutlet weak var lable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

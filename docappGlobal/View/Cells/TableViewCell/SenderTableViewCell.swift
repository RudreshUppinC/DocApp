//
//  SenderTableViewCell.swift
//  docappGlobal
//
//  Created by DarkMoon on 25/03/23.
//

import UIKit

class SenderTableViewCell: UITableViewCell {
    static let identifier = String(describing: SenderTableViewCell.self)

    @IBOutlet weak var senderMsgLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  ReplyTableViewCell.swift
//  docappGlobal
//
//  Created by DarkMoon on 25/03/23.
//

import UIKit

class ReplyTableViewCell: UITableViewCell {
    static let identifier = String(describing: ReplyTableViewCell.self)

    @IBOutlet weak var replyMsgLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

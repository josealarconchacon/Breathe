//
//  MainTableViewCell.swift
//  Breathe
//
//  Created by Jose Alarcon Chacon on 11/23/20.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var cadenceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

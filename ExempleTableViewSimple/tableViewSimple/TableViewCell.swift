//
//  TableViewCell.swift
//  tableViewSimple
//
//  Created by Ali ED-DBALI on 14/02/2019.
//  Copyright © 2019 Ali ED-DBALI. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var descriptionCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

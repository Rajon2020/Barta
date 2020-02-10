//
//  TableViewCell.swift
//  Barta
//
//  Created by apple on 2/5/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView?.layer.cornerRadius = 10
        cellImageView?.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

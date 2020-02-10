//
//  TravelTableViewCell.swift
//  Barta
//
//  Created by apple on 2/6/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class TravelTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var cellInfo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         cellImage?.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

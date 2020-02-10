//
//  EntertainmentTableViewCell.swift
//  Barta
//
//  Created by apple on 2/6/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class EntertainmentTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
        @IBOutlet weak var cellInfo: UILabel!
        
        override func awakeFromNib() {
            super.awakeFromNib()
            cellImage?.layer.cornerRadius = 10
            cellInfo.layer.cornerRadius = 10
            
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }

    }


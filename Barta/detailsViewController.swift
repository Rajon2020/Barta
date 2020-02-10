//
//  detailsViewController.swift
//  Barta
//
//  Created by apple on 2/9/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class detailsViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    
    var detailsLabel = ""
    var detailsImage = UIImage()
    var imageUrl = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url = URL(string: imageUrl)
        
        DispatchQueue.global().async {
            let data = try?Data(contentsOf: url!)
            DispatchQueue.main.async {
                //withAlamofireImageloadingWithurl;
                self.image.image = UIImage(data: data!)
                //cell.cellImageView.image = UIImage(data: data!)
            }
            
        }
        lbl.text = detailsLabel
        //image.image = detailsImage
    }
    

    

}

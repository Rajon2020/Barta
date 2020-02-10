//
//  SportsViewController.swift
//  Barta
//
//  Created by apple on 2/5/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class SportsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    
    
    var modelData = [MyModel]()
    var titleName = [String]()
    var imageName = [String]()
    var newsArray = ["S1","S2","S3","S4","S5"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       loadData()
        // Do any additional setup after loading the view.
    }
    
    
      func loadData() {
          let url = URL(string: "https://jsonplaceholder.typicode.com/photos")
          URLSession.shared.dataTask(with: url!) { (data, response, error) in
              if error == nil {
                  do{
                      let myData = try! JSONDecoder().decode([MyModel].self, from: data!)
                      DispatchQueue.main.async {
                          for n in myData{
                              self.titleName.append(n.title)
                              self.imageName.append(n.url)
                          }
                          
                          self.tableView.reloadData()
                      }
                  }catch{
                      print("nothing")
                  }
                  
              }
              
          }.resume()
      }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SportTableViewCell
//        cell.accessoryType = .disclosureIndicator
//        cell.cellImage.image = UIImage(named: newsArray[indexPath.row])
//        cell.cellInfo.text = newsArray[indexPath.row]
//
        let url = URL(string: imageName[indexPath.row])
               DispatchQueue.global().async {
                   //let data = try?Data(contentsOf: url!)
                   DispatchQueue.main.async {
                       //withAlamofireImageloadingWithurl;
                       cell.cellImage.af_setImage(withURL: url!)
                       cell.cellInfo.text = self.titleName[indexPath.row]
                       //cell.cellImageView.image = UIImage(data: data!)
                   }
                   
               }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailsViewController") as! detailsViewController
       vc.imageUrl = imageName[indexPath.row]
               vc.detailsLabel = titleName[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}

//
//  SViewController.swift
//  Barta
//
//  Created by apple on 2/5/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class SViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var myArray = ["Top News","Sports","Travel","Politics","Entertainment","TecNews"]
    var searchArray = [String]()
    var searching = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchBar.backgroundColor = UIColor.lightGray
        searchBar.layer.cornerRadius = 15
        
         self.navigationItem.title = "Search Nesws"
        
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       if searching {
            return searchArray.count
        }else{
            return myArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchcell")
       cell?.accessoryType = .disclosureIndicator
        if searching {
            cell?.textLabel?.text = searchArray[indexPath.row]
        }else{
            cell?.textLabel?.text = myArray[indexPath.row]
        }
        return cell!
    }
    var a = "SearchViewController"
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: a)
        self.navigationController?.pushViewController(vc!, animated: true)
    }

}
extension SViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       searching = true
        searchArray = myArray.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased() })

        tableView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
        
    }
}


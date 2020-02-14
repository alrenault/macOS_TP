//
//  ViewController.swift
//  table
//
//  Created by tp on 12/02/2020.
//  Copyright © 2020 Me. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource {
    //protocole = interface en java
    
    //POUR UITableViewDataSource
    @IBOutlet weak var tableView: UITableView!
    
    let data = ["L1","L2","L3","M1","M2"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellule = tableView.dequeueReusableCell(withIdentifier: "UneCellule", for: indexPath)
        
        cellule.textLabel?.text = data[indexPath.row]
        
        return cellule
    }
    
    //------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        let url = URL(string: "http://eddbali.net/files/iOS/Documents/monuments.json")
        
        Alamofire.request(url!, method: .get).responseJSON{ (response) in
            if response.result.isSuccess{
                let contenuJSON : JSON = JSON(response.result.value!)
                
                print(contenuJSON)
            }else{
                print("ERREUR : + \(response.result.error!)")
            }
        }
    }

    

}


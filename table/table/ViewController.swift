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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //protocole = interface en java
    
    //POUR UITableViewDataSource
    @IBOutlet weak var tableView: UITableView!
    
    var monumentTitre = [String]()
    var data = JSON()
    var monumentDesc = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monumentTitre.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellule = tableView.dequeueReusableCell(withIdentifier: "UneCellule", for: indexPath)
        
        cellule.textLabel?.text = monumentTitre[indexPath.row]
        cellule.detailTextLabel?.text = monumentDesc[indexPath.row]
        
        return cellule
    }
    
    //------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let url = URL(string: "http://eddbali.net/files/iOS/Documents/monuments.json")
        
        Alamofire.request(url!, method: .get).responseJSON{ (response) in
            if response.result.isSuccess{
                let contenuJSON : JSON = JSON(response.result.value!)
                self.data = contenuJSON
                self.majMonuments(self.data)
                self.tableView.reloadData()
                //print(contenuJSON)
            }else{
                print("ERREUR : + \(response.result.error!)")
            }
        }
    }
    
    private func majMonuments(_ data : JSON ){
    
        for elem in data["categories"].arrayValue{
            for monument in elem["monuments"].arrayValue{
                self.monumentTitre.append(monument["titre"].stringValue)
                self.monumentDesc.append(monument["description"].stringValue)
            }
            
        }
    
    }
    
    

    

}


//
//  ViewController.swift
//  testTVRefresh
//
//  Created by Ali ED-DBALI on 19/03/2019.
//  Copyright © 2019 Ali ED-DBALI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableData = [String]()
    var refreshControl = UIRefreshControl()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = tableData[indexPath.row]
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableData.append("Swift")
        tableData.append("Java")
        tableData.append("C")
        addRefreshControl()
    }


    func addRefreshControl() {
        refreshControl.tintColor = UIColor.red
        refreshControl.attributedTitle = NSAttributedString(string: "Dernier refresh : \(getRefreshDate())...")
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc func refreshData() {
        tableData.append("Scala")
        tableData.append("C++")
        let deadlineTime = DispatchTime.now() + .seconds(5) // Ajouter 5 secondes à l'instant présent
        // Attendre deadlineTime avant d'exécuter le code
        DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: {
            self.refreshControl.attributedTitle = NSAttributedString(string: "Dernier refresh : \(self.getRefreshDate())...")
            self.refreshControl.endRefreshing() // Arrêt de l'animation de rafraichissement
            self.tableView.reloadData()         // Recharger la tableView
            self.updateRefreshDate()
        })
        
    }
    
    func getRefreshDate() -> String {
        var returnDate = Date()
        if let date = UserDefaults.standard.object(forKey: "date") as? Date {
            returnDate = date
        } else {
            UserDefaults.standard.setValue(returnDate, forKey: "date")
        }
        print(returnDate)

        let formatDate = DateFormatter()
        formatDate.dateFormat = "E, dd MMM yyyy HH:mm:ss"
        return formatDate.string(from: returnDate)
        
    }
    
    func updateRefreshDate() {
        UserDefaults.standard.setValue(Date(), forKey: "date")
    }
}


//
//  ViewController.swift
//  tableViewSimple
//
//  Created by Ali ED-DBALI on 12/02/2019.
//  Copyright © 2019 Ali ED-DBALI. All rights reserved.
//

/*
 Code qui montre :
 - l'utilisation d'une tableview avec des cellules personnalisées
 - l'envoi vers un écran au clique sur une cellule
 - transmission des données de la cellule vers ce nouvel écran
 - supprimer une cellule de la tableview
 */
import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Data

    var headlines = [
        Headline(id: 1, title: "Pomme", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque id ornare tortor, quis dictum enim. Morbi convallis tincidunt quam eget bibendum. Suspendisse malesuada maximus ante, at molestie massa fringilla id.", image: "Apple"),
        Headline(id: 2, title: "Banane", text: "Ut eget massa erat. Morbi mauris diam, vulputate at luctus non, finibus et diam. Morbi et felis a lacus pharetra blandit.", image: "Banana"),
        Headline(id: 3, title: "Melon", text: "Aliquam egestas ultricies dapibus. Nam molestie nunc in ipsum vehicula accumsan quis sit amet quam. Sed vel feugiat eros.", image: "Cantaloupe"),
        Headline(id: 4, title: "Abricot", text: "Nulla vitae elit libero, a pharetra augue. Donec ullamcorper nulla non metus auctor fringilla. Cras mattis consectetur purus sit amet fermentum. Sed posuere consectetur est at lobortis.", image: "Apricot"),
        ]
    
    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headlines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! TableViewCell
        
        let headline = headlines[indexPath.row]
        cell.titleCell?.text = headline.title
        cell.descriptionCell?.text = headline.text
        cell.imageCell?.image = UIImage(named: headline.image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DvC = Storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        tableView.deselectRow(at: indexPath, animated: true)

        DvC.imageCurrent = headlines[indexPath.row].image
        DvC.titleCurrent = headlines[indexPath.row].title
        DvC.desriptionCurrent = headlines[indexPath.row].text
        
        self.navigationController?.pushViewController(DvC, animated: true)
    }
    
    // Suppression d'une cellule
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Cellule supprimée")
            
            self.headlines.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}


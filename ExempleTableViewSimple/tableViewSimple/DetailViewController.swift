//
//  DetailViewController.swift
//  tableViewCustom
//
//  Created by Ali ED-DBALI on 15/02/2019.
//  Copyright © 2019 Ali ED-DBALI. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var imageCurrent : String = ""
    var titleCurrent : String = ""
    var desriptionCurrent : String
        = ""
    @IBOutlet weak var imageDvC: UIImageView!
    
    @IBOutlet weak var titleDvC: UILabel!
    
    @IBOutlet weak var descriptionDvC: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageDvC.image = UIImage(named: imageCurrent)
        titleDvC.text = titleCurrent
        descriptionDvC.text = desriptionCurrent
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

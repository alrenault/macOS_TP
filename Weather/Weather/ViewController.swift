//
//  ViewController.swift
//  Weather
//
//  Created by tp on 31/01/2020.
//  Copyright © 2020 tp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "localhost:8888/data/monuments.json")
    }


}


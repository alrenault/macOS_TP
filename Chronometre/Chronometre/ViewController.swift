//
//  ViewController.swift
//  Chronometre
//
//  Created by tp on 31/01/2020.
//  Copyright © 2020 tp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var cpt: UILabel!
    
    var chronoString : String = "00:00"
    var chrono : Int = 0
    var chronoMin : Int = 0
    var chronoSec : Int = 0
    var chronoCenti : Int = 0
    
    var timer = Timer()
    
    var running : Bool = false
 
    @IBAction func startAction(_ sender: Any) {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.01,target: self, selector:#selector(self.incrementer), userInfo: nil,repeats: true)
        
    }
    
    @IBAction func stopAction(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func restartAction(_ sender: Any) {
        timer.invalidate()
        self.restart()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func incrementer(){
        chrono += 1
        chronoCenti = chrono%100
        chronoSec = chrono/100
        chronoMin = chronoSec/60
        var zeroCenti = ""
        var zeroSec = ""
        var zeroMin = ""
        
        if(chronoCenti < 10){
            zeroCenti = "0"
        }
        if(chronoSec < 10){
            zeroSec = "0"
        }
        if(chronoMin < 10){
            zeroMin = "0"
        }
        
        cpt.text = "\(zeroMin)\(chronoMin):\(zeroSec)\(chronoSec%60):\(zeroCenti)\(chronoCenti)"
    }
    
    @objc func restart(){
        chrono = 0
        cpt.text = "00:00:00"
    }


}


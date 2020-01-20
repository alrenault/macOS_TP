//
//  ViewController.swift
//  tictactoe
//
//  Created by tp on 20/01/2020.
//  Copyright © 2020 tp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var joueur = 1 // 1:croix 2:rond
    var status = Array(repeating: -1, count: 9)
    
    @IBOutlet weak var monBouton: UIButton!
    
    @IBOutlet var restart: UIView!
    @IBAction func enfonce(_ sender: UIButton) {
        
        if(!verifWin(tab: status)){
            print("Bouton enfoncé")
            
            status[sender.tag-1] = joueur
            
            if joueur == 1 {
                sender.setImage(UIImage(named: "croix.png"), for: .normal)
                joueur = 2
            }
            else{
                sender.setImage(UIImage(named: "rond.png"), for: .normal)
                joueur = 1
            }
            
            sender.isEnabled = false
            if(verifWin(tab: status)){
                print("JOUEUR \(joueur) A GAGNE")
                restart.isHidden = false
            }
        }
        
    }
    
    @IBAction func toggleRestart(_ sender: Any) {
        joueur = 1
        var status = Array(repeating: -1, count: 9)
        
        restart.isHidden = true
        
        var i = 1
        
        while i < 10{
            let but = self.view.viewWithTag(i) as? UIButton
            but?.setImage(UIImage(named: ""),for: .normal)
            but?.isEnabled = true
            i = i + 1
        }
    }
    func verifWin(tab: [Int]) -> Bool{
        //lignes
        var i = 0
        while i < 9{
            if(tab[i] == tab[i+1] && tab[i+1] == tab[i+2] && tab[i] != -1){
                return true
            }
            i = i+3
        }
        
        //colonnes
        i = 0
        while i < 3{
            if(tab[i] == tab[i+3] && tab[i+3] == tab[i+6] && tab[i] != -1){
                return true
            }
            
            i = i+1
        }
        
        if(tab[0] == tab[4] && tab[4] == tab[8] && tab[0] != -1){
            return true
        }
        
        if(tab[2] == tab[4] && tab[4] == tab[6] && tab[2] != -1){
            return true
        }
        
        return false
    }
    
    func verifLoose(tab: [Int]) -> Bool{
        for i in tab{
            if i != -1{
                return true
                }
            }
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}


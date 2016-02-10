//
//  PokemonDetailVC.swift
//  Pokedex-by-Digimark
//
//  Created by Marc Aupont on 2/6/16.
//  Copyright © 2016 Digimark Technical Solutions. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var mainImg: UIImageView!
    @IBOutlet var descriptionLbl: UILabel!
    @IBOutlet var typeLbl: UILabel!
    @IBOutlet var defenseLbl: UILabel!
    @IBOutlet var heightLbl: UILabel!
    @IBOutlet var pokedexIdLbl: UILabel!
    @IBOutlet var evoLbl: UILabel!
    @IBOutlet var currentEvoImg: UIImageView!
    @IBOutlet var nextEvoImg: UIImageView!
    @IBOutlet var weightLbl: UILabel!
    @IBOutlet var attackLbl: UILabel!
    
    
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name.capitalizedString
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image = img
        
        //This will be called after download is done
        pokemon.downloadPokemonDetails { () -> () in
            
            self.updateUI()
        }
    }
    
    func updateUI() {
        
        descriptionLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        attackLbl.text = pokemon.attack
        pokedexIdLbl.text = String(pokemon.pokedexId)
        
        if pokemon.nextEvolutionId == "" {
            
            evoLbl.text = "No Evolutions"
            nextEvoImg.hidden = true
            
        } else {
            
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            var str = "Next Evolution: \(pokemon.nextEvolutionTxt.capitalizedString)"
            
            if pokemon.nextEvolutionLvl != "" {
                
                str += " - LVL \(pokemon.nextEvolutionLvl)"
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }

  

}

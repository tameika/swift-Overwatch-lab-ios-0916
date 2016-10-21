//
//  ViewController.swift
//  Overwatch
//
//  Created by Jim Campagno on 10/9/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let game = Game()
        
        print("Hello")
        print(game.defenseCharacters)
        
        for hero in game.defenseCharacters{
            print(hero.description)
        }
    }
}

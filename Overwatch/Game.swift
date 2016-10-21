//
//  Game.swift
//  Overwatch
//
//  Created by Christopher Boynton on 10/21/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation


struct Game {
    
    var offenseCharacters: [Hero] = []
    var defenseCharacters: [Hero] = []
    var supportCharacters: [Hero] = []
    var tankCharacters: [Hero] = []
    
    var heroType: HeroType = .offense
    
    init() {
        createAllHeroes()
    }
}

extension Game {
    mutating func createAllHeroes() {
        for heroType in HeroType.allTypes {
            switch heroType {
            case .offense:
                let offenseNames = HeroName.heroes(with: heroType)
                for name in offenseNames {
                    offenseCharacters.append(Hero(name: name))
                }
            case .defense:
                let defenseNames = HeroName.heroes(with: heroType)
                for name in defenseNames {
                    defenseCharacters.append(Hero(name: name))
                }
            case .tank:
                let tankNames = HeroName.heroes(with: heroType)
                for name in tankNames {
                    tankCharacters.append(Hero(name: name))
                }
            case .support:
                let supportNames = HeroName.heroes(with: heroType)
                for name in supportNames {
                    supportCharacters.append(Hero(name: name))
                }
            }
        }
    }
    
    func heroesForType() -> [Hero] {
        switch heroType {
        case .offense:
            return offenseCharacters
        case .defense:
            return defenseCharacters
        case .support:
            return supportCharacters
        case .tank:
            return tankCharacters
        }
    }
    
}









//
//  OverwatchHero.swift
//  Overwatch
//
//  Created by Christopher Boynton on 10/21/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation


typealias Health = Int

protocol Weapon {
    func fire() -> String
    func heal() -> String
}

protocol OverwatchHero: Weapon, CustomStringConvertible {
    var name: HeroName { get set }
    var hitPoints: Health { get set }
    var heroType: HeroType { get }
    
    func produceHeroType() -> HeroType
    func produceInitialHitPoints() -> Health
}

extension OverwatchHero {
    
    func produceHeroType() -> HeroType {
        switch name {
        case .genji, .mcCree, .pharah, .reaper, .soldier76, .tracer:
            return .offense
        case .bastion, .hanzo, .junkrat, .mei, .torbjörn, .widowmaker:
            return .defense
        case .dva, .reinhardt, .roadhog, .winston, .zarya:
            return .tank
        case .ana, .lúcio, .mercy, .symmetra, .zenyatta:
            return .support
        }
    }
    
    func fire() -> String {
        switch heroType {
        case .offense:
            return "Offense: 👊🏽"
        case .defense:
            return "Defense: ✋🏽"
        case .support:
            return "Support: 👐🏽"
        case .tank:
            return "Tank: ✊🏽"
        }
    }
    
    func heal() -> String {
        switch heroType {
        case .offense, .defense, .tank:
            return "Heal: ✖️"
        case .support:
            return "Heal: ❤️"
        }
    }
}

extension OverwatchHero {
    
    func produceInitialHitPoints() -> Health {
        switch heroType {
        case .offense, .defense:
            return 250
        case .support:
            return 150
        case .tank:
            return 500
        }
    }
//}
//
//extension OverwatchHero {
    var description: String {
        var description = ""
        
        description += "Name: \(name.description)\n"
        description += "Type: \(heroType.description)\n"
        description += "Attack: \(fire())\n"
        description += "Heal: \(heal())\n"
        description += "Hit Points: \(produceInitialHitPoints())"
        
        return description
    }
}






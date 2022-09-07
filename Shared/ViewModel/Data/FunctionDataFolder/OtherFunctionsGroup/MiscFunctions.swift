//
//  Other.swift
//  PokeTeam_1.8
//
//  Created by Delvin Cockroft on 8/27/22.
//

import Foundation
import SwiftUI

extension MainData{

    // Garbage
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(store.items.count))
    }
    
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(store.items.count) * distance(item)
        return sin(angle) * 75
    }
    
    func checkPoketeam(pokeTeam: [Pokemon?], poke: Pokemon?) -> Bool{
        var answer = false
        
        for team in pokeTeam {
            if team!.name == poke!.name{
                answer = true
            }
        }
        return answer
    }
    struct returnedStat{
        var amount: Int
        var name: String
    }
    func findLargestStat(poke: Pokemon) -> returnedStat{
        var statAmount = 0
        var statName = ""

        for stat in poke.stats{
            if stat.base_stat > statAmount{
                statAmount = stat.base_stat
                statName = stat.stat.name
            }
        }
        
        return returnedStat(amount: statAmount, name: statName)
    }

}


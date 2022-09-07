//
//  CallFunctions.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 9/4/22.
//

import Foundation
import SwiftUI

extension MainData{
    
    // call functions
    func callEvolutions(evoChain : EvolutionChain) -> [String]{
        var answer = [String]()
        
        answer.append(evoChain.chain.species.name)
        if evoChain.chain.evolves_to.count > 0 {
            answer.append(evoChain.chain.evolves_to[0].species.name)
            if evoChain.chain.evolves_to[0].evolves_to.count > 0 {
                answer.append(evoChain.chain.evolves_to[0].evolves_to[0].species.name)
            }
        }
         print("\(answer)")
        return answer
    }
    
    func callGenus(species: SpeciesResource?) -> String{
        var answer = ""
        
        if let _ = species{
            for genus in species!.genera {
                if genus.language.name == "en" {
                    answer = genus.genus
                }
            }
        } else{
            print("There is no species")
        }
        
        
        return answer
    }
    func callStats(poke: Pokemon) -> [[Any]]{
        let answer = [
            []
        ]
        
        return answer
    }
    
    func callPokemonByName(poke: String) -> Pokemon{
        var answer : Pokemon?
        for pokemon in self.PokemonArray{
            if pokemon.name == poke {
                answer = pokemon
            }
        }
        return answer!
    }
    func callSearchedPokemon(poke: String) -> Bool {
        var answer = false
        
        for pokemon in self.PokemonArray{
            if pokemon.name == poke {
                answer = true
                print("searched pokemon \(poke) was in array")
            }
            if pokemon.name.capitalizingFirstLetter() == poke{
                answer = true
                print("searched pokemon \(poke) was in array")
            }
            if pokemon.name.capitalized == poke{
                answer = true
                print("searched pokemon \(poke) was in array")
            }
            if "\(pokemon.name) " == poke{
                answer = true
                print("searched pokemon \(poke) was in array")
            }
        }
        if answer == false {
            print("searched pokemon \(poke) was not in array")
        }

        return answer
    }
    
    func callPokeTeamNames() -> [String]{
        var answer = [String]()
        for poke in self.PokeTeam {
            answer.append(poke!.name)
        }
        
        print("callPokeTeamNames RAN : More Info -> ViewModel -> FunctionDataFolder -> Other")
        print("The team names are \(answer) \n")
        return answer
    }
}

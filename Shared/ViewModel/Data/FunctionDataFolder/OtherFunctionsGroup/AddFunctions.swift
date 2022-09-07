//
//  AddFunctions.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 9/4/22.
//

import Foundation
import SwiftUI

extension MainData{
    
    // add functions
    func addType(item: String){
        if self.pokemonTypeData.chosenTypes.contains(item) == true{
            self.pokemonTypeData.chosenTypes = self.pokemonTypeData.chosenTypes.filter{$0 != item}
            print("after removal the chosenTypes array is : \(self.pokemonTypeData.chosenTypes)")
            print("\(item) was removed to chosenTypes array : More Info -> FunctionData File -> addType function \n")
        } else {
            self.pokemonTypeData.chosenTypes.append(item)
            print("after addition the chosenTypes array is : \(self.pokemonTypeData.chosenTypes)")
            print("\(item) was added to chosenTypes array : More Info -> FunctionData File -> addType function \n")
        }
    }
    func addGen(item: String){
        if self.pokemonGenData.chosenGen.contains(item) == true{
            self.pokemonGenData.chosenGen = self.pokemonGenData.chosenGen.filter{$0 != item}
            print("after removal the chosenGen array is : \(self.pokemonGenData.chosenGen)")
            print("\(item) was removed to chosenGen array : More Info -> FunctionData File -> addType function \n")
        } else {
            self.pokemonGenData.chosenGen.append(item)
            print("after addition the chosenGen array is : \(self.pokemonGenData.chosenGen)")
            print("\(item) was added to chosenGen array : More Info -> FunctionData File -> addType function \n")
        }
    }
    func addStat(item: String){
        self.pokemonStatData.chosenStat = item
        print("\(item) is the chosenStat : More Info -> FunctionData File -> addType function \n")
    }
    
    func addSearchedPokemon(poke: String){
        for pokemon in self.PokemonArray{
            if pokemon.name == poke {
                self.CurrentPokemonForStatPage = pokemon
            }
        }
    }
    
    func addToPokeTeam(poke: Pokemon?, isAdd : Bool){
        if isAdd {
            self.PokeTeam.append(poke)
            print("\(poke!.name) was added to your PokeTeam")
            for (index,team) in self.PokeTeam.enumerated(){
                print("PokeTeam Contains : #\(index + 1) \(team?.name ?? "No Pokemon")")
            }
        } else {
            for (index,team) in self.PokeTeam.enumerated(){
                if poke!.name == team!.name{
                    self.PokeTeam.remove(at: index)
                    print("\(poke!.name) was added to your PokeTeam")
                    for (index,team) in self.PokeTeam.enumerated(){
                        print("PokeTeam Contains : #\(index + 1) \(team?.name ?? "No Pokemon")")
                    }
                }
            }
            
        }
    }
    
    func addToStatPage(poke: Pokemon?){
        self.CurrentPokemonForStatPage = poke
        withAnimation(self.mySpring){
            self.pageData.pageNumber = 3
        }
        print("pokemon added to Stat Page")
    }
}

//
//  FilterFunctions.swift
//  PokeTeam_1.8
//
//  Created by Delvin Cockroft on 8/27/22.
//

import Foundation
import SwiftUI

extension MainData{
    // MARK: FILTER functions
    // Main filters
    func filterPokemon(){
        self.PokemonTypeArray.removeAll()
        

        if self.pokemonGenData.chosenGen.count > 1 && self.pokemonGenData.chosenGen.count < 9 || self.pokemonTypeData.chosenTypes.count > 1 {
            self.pokemonTypeData.arraySelectionInt = 1
            self.pageData.pageNumber = 1
            
            self.isNecessacaryFilter()
        }
        if self.pokemonGenData.chosenGen.count == 9 && self.pokemonTypeData.chosenTypes.count == 1 {
            self.pokemonTypeData.arraySelectionInt = 0
            self.pageData.pageNumber = 1
        }
        if self.pokemonStatData.chosenStat != "none"{
            self.sortPokemonByStat(chosenStat: self.pokemonStatData.chosenStat)
            self.pokemonTypeData.arraySelectionInt = 0
            self.pageData.pageNumber = 1
        } else if self.pokemonStatData.chosenStat == "none" {
            self.PokemonArray.sort(by: {$0.id < $1.id})
        }
        print("returning to page \(self.pageData.pageNumber) with array selection \(self.pokemonTypeData.arraySelectionInt) \n")
    }
    // Secondary Filters
    func isNecessacaryFilter(){
        for poke in self.PokemonArray {
            // filter by TYPE && GEN
            if self.filterByTypeOrGen() == "GEN" {
                if filterPokemonByGen(poke: poke) == true{
                    self.PokemonTypeArray.append(poke)
                }
            } else if self.filterByTypeOrGen() == "TYPE" {
                if filterPokemonByType(poke: poke) == true {
                    self.PokemonTypeArray.append(poke)
                }
            } else if self.filterByTypeOrGen() == "GEN & TYPE" {
                if filterPokemonByType(poke: poke) == true && filterPokemonByGen(poke: poke) == true{
                    self.PokemonTypeArray.append(poke)
                }
            } else if self.filterByTypeOrGen() == "NONE" {
                print("no filter needed")
            }
            
        }
        print("filtering...")
        // Sort by STAT
        if self.pokemonStatData.chosenStat != "none"{
            self.sortPokemonByStat(chosenStat: self.pokemonStatData.chosenStat)
        } else if self.pokemonStatData.chosenStat == "none" {
            self.PokemonTypeArray.sort(by: {$0.id < $1.id})
        }
        print("FILTER INFORMATION!!")
        print("filterPokemonByType function has been RUN : More Info -> MainData File")
        print("Chosen types are : \(self.pokemonTypeData.chosenTypes)")
        print("filterPokemonByGen was RUN : More Info -> MainData File")
        print("Chosen generations are : \(self.pokemonGenData.chosenGen)")
        print("Filter pokemon funciton RUN: More Info -> MainData file \n")
    }

    func filterByTypeOrGen() -> String{
        var answer = ""
        if self.pokemonGenData.chosenGen.count > 1 && self.pokemonGenData.chosenGen.count < 9 && self.pokemonTypeData.chosenTypes.count == 1 {
            answer = "GEN"
        } else if self.pokemonGenData.chosenGen.count == 9 && self.pokemonTypeData.chosenTypes.count > 1 {
            answer = "TYPE"
        } else if self.pokemonGenData.chosenGen.count > 1 && self.pokemonGenData.chosenGen.count < 9 || self.pokemonTypeData.chosenTypes.count > 1 {
            answer = "GEN & TYPE"
        } else {
            answer = "NONE"
        }
        return answer
    }

    // fitler by Evolution
    func filterMega(){
        print("filterMega Still needs to be setup : More Info -> MainData")
    }
    func filterGiga(){
        print("filterGiga Still needs to be setup : More Info -> MainData")
    }

    func filterPokemonByType(poke: Pokemon) -> Bool{
        var hasChosenType = false

        for type in self.pokemonTypeData.chosenTypes{

            if poke.types.count > 1{
                // if either or the types are equal to the "chosen type" return true
                if poke.types[0].type.name == type {
                    hasChosenType = true
                }else if poke.types[1].type.name == type{
                    hasChosenType = true
                }

            } else {
                // if the type are equal to the "chosen type"  return true
                if poke.types[0].type.name == type {
                    hasChosenType = true
                }
            }
        }
        return hasChosenType
    }
    func filterPokemonByGen(poke: Pokemon) -> Bool{
        var hasChosenGen = false

        for gen in self.pokemonGenData.chosenGen {
            if callGeneration(poke: poke) == gen {
                hasChosenGen = true
            }
        }
        return hasChosenGen
    }
    func callGeneration(poke: Pokemon) -> String{
        var gen = ""
        
        if poke.game_indices.isEmpty == false{
            gen = poke.game_indices[0].version.name
        } else if poke.moves.isEmpty == false {
            gen = poke.moves[0].version_group_details[0].version_group.name
        }
        return gen
    }
    func filterPokemonByEvolution(pokeArray: [Pokemon], chosenEvoOne: String, chosenEvoTwo: String){
        print("filterPokemonByEvolution was RUN : More Info -> MainData File \n")
    }

    func sortPokemonByStat(chosenStat: String){
        let index = self.pokemonStatData.allStats.firstIndex(of: self.pokemonStatData.chosenStat)
        self.PokemonArray.sort(by: {$0.stats[index ?? 1].base_stat > $1.stats[index ?? 1].base_stat })
        self.PokemonTypeArray.sort(by: {$0.stats[index ?? 1].base_stat > $1.stats[index ?? 1].base_stat })
        print("sorting...")
    }

    func orientationFilter(number: Int){
        // if its number one then the orientaion is Grid
        if number == 1{
            if self.columnData.columns.count < 2{
                self.columnData.columns.append(GridItem(.flexible()))
                self.columnData.columns.append(GridItem(.flexible()))
                self.columnData.isGrid = true
                print("Grid ACTIVE: More Info -> Filter Page -> struct OrientaionFilter")
            } else{
                print("ACTIVE appearance not changed from GRID:  More Info -> Filter Page -> struct OrientaionFilter")
            }
        } else {
            // if its number one then the orientaion is Grid
            if self.columnData.columns.count > 1{
                self.columnData.columns.remove(at: 1)
                self.columnData.columns.remove(at: 0)
                self.columnData.isGrid = false
                print("List ACTIVE: More Info -> Filter Page -> struct OrientaionFilter")
            } else {
                print("ACTIVE appearance not changed from LIST:  More Info -> Filter Page -> struct OrientaionFilter")
            }
        }
    }
    
    func findEnglishFilter(text : [FlavorText]) -> String{
        var answer = ""
        for flavor in text {
            if flavor.language.name == "en" {
                answer = flavor.flavor_text
            }
        }
        return answer
    }

    // RESET Filters
    func resetFilter(){
        self.pokemonTypeData.arraySelectionInt = 0
        self.pageData.pageNumber -= 1
        self.resetGenFilter()
        self.resetTypeFilter()
        self.resetStatFilter()
        
        print("chosen types : \(self.pokemonTypeData.chosenTypes), chosen generations : \(self.pokemonGenData.chosenGen), chosen stat : \(self.pokemonStatData.chosenStat)")
        print("resetFilter ACTIVATED : More Info -> FunctionData File -> resetFilter function \n")
    }

    func resetGenFilter(){
        let genReset = ["none", "red", "ruby", "gold", "diamond", "black", "x-y", "sun-moon", "sword-shield"]
        self.pokemonGenData.chosenGen.removeAll()
        self.pokemonGenData.chosenGen.append(contentsOf: genReset)
    }
  
    func resetTypeFilter(){
        self.pokemonTypeData.chosenTypes.removeAll()
        self.pokemonTypeData.chosenTypes.append("none")
    }
    func resetStatFilter(){
        self.pokemonStatData.chosenStat = "none"
    }
    
    // Garbage filters
    func removeReturnCharacters(text: String) -> String{
        let answer = "\(text)"
        let filterAnswer = String(answer.replacingOccurrences(of: "\n", with: " "))

        return filterAnswer
    }
    
    func whatever(){
        print("Hello World!")

    }
}



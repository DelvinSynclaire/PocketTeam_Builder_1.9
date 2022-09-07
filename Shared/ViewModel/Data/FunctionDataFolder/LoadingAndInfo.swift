//
//  LoadingAndInfo.swift
//  PokeTeam_1.8
//
//  Created by Delvin Cockroft on 8/27/22.
//

import Foundation
import SwiftUI

extension MainData{
    // MARK: LOADING in functions
    // Major and minor loding data
    func loadPokemonData(pokemonAPI : [Result]) {
        for poke in pokemonAPI{

            guard let url = URL(string: "\(poke.url)") else {
                return
            }
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else { return }
                if let decodeData = try? JSONDecoder().decode(Pokemon.self, from: data){
                    DispatchQueue.main.async { [self] in
                        ConvertData(pokemon: decodeData)
                    }
                }
            }.resume()
        }
        print("load pokemon data function was RUN : More Info -> MainData File \n")
    }
    func loadData() {
    guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0") else {
        return
    }
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data else { return }
        if let decodeData = try? JSONDecoder().decode(ListOfPokemon.self, from: data){
            DispatchQueue.main.async {
                self.loadPokemonData(pokemonAPI: decodeData.results)
            }
        }
    }.resume()
        print("load data function was RUN : More Info -> MainData File \n")
    }
    
    // Stat page loading Data
    /// loading evolution subView
    func loadEvolutionResourceData(evoURL: String) {
    guard let url = URL(string: "\(evoURL)") else {
        return
    }
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data else { return }
        if let decodeData = try? JSONDecoder().decode(SpeciesResource.self, from: data){
            DispatchQueue.main.async {
                self.CurrentPokemonSpeciesResource = decodeData
                self.loadEvolutionChainData(chainURL: decodeData.evolution_chain.url)
                print("loading Evolution resource data says \(decodeData.egg_groups[0].name)")
                print("Evolution Resource function can be found loading in : View -> Stat Page Folder -> Main StatPage as an OnAppear function \n")
            }
        }
    }.resume()
        print("loadEvolutionResourceData function was RUN : More Info -> MainData File \n")
    }
    ///loading evolution chain subView
    func loadEvolutionChainData(chainURL: String) {
    guard let url = URL(string: "\(chainURL)") else {
        return
    }
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data else { return }
        if let decodeData = try? JSONDecoder().decode(EvolutionChain.self, from: data){
            DispatchQueue.main.async {
                self.CurrentPokemonEvolutionChain = decodeData
                if decodeData.chain.evolves_to.count == 1{
                    print("successfully RAN loadEvolutionChainData function: MORE INFO - > ViewModel Folder -> Data Folder -> Loading And Info File")
                }

            }
        }
    }.resume()
    }
    /// loading Ability subView
    func loadEvolutionAbilityData(abiURL: String) {
    guard let url = URL(string: "\(abiURL)") else {
        return
    }
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data else { return }
        if let decodeData = try? JSONDecoder().decode(AbilityResource.self, from: data){
            DispatchQueue.main.async {
                self.CurrentPokemonAbilityResource.append(decodeData)
                if decodeData.effect_entries.count > 0{
                    print("loading Ability resource data says \(decodeData.effect_entries[0].short_effect)")
                } else {
                    print("Pokemon has no Ability")
                }
                
                print("Ability Resource function can be found loading in : View -> Stat Page Folder -> Main StatPage as an OnAppear function \n")
            }
        }
    }.resume()
        print("loadEvolutionAbilityData function was RUN : More Info -> MainData File \n")
    }

    // loading type data for subView
    func loadTypeData(poke: Pokemon){
        for pokemon in poke.types {
            guard let url = URL(string: "\(pokemon.type.url)") else {
                return
            }
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else { return }
                if let decodeData = try? JSONDecoder().decode(TypeResource.self, from: data){
                    DispatchQueue.main.async {
                        self.PokemonTypeResource = decodeData
                        print("loading Type resource data says \(decodeData.name)")
                        print("Type Resource function can be found loading in : View -> Stat Page Folder -> Main StatPage as an OnAppear function \n")
                    }
                }
            }.resume()
        }
    }
    func ConvertData(pokemon: Pokemon){
        let urlOfImage = URL(string: pokemon.sprites.front_default)!
       self.ImagePokemonDictionary[pokemon.name] = urlOfImage
        self.PokemonArray.append(pokemon)
    }
    
    // MARK: INFORMATION functions
    func searchPageInfo(){
        print("searchPageInfo function RUN")
        if self.pokemonTypeData.arraySelectionInt == 0 {
            print("The current array -> PokemonArray")
            print("TOTAL pokedex pokemon Displayed : \(self.PokemonArray.count)")
        } else {
            print("The current array -> PokemonTypeArray")
            print("TOTAL filtered pokemon Displayed : \(self.PokemonTypeArray.count)")
        }
        print("More Info -> SearchPage File \n")
    }
}


//
//  File2.swift
//  PokeTeam_1.8
//
//  Created by Delvin Cockroft on 8/2/22.
//

import Foundation
import SwiftUI

@MainActor class MainData: ObservableObject {
    @Published var pageData = PageData(pageNumber: 0, pageHeight: 0.0, pageWidth: 0.0, maskOffsetOne: 150, maskOffsetTwo: 150, maskIsShowing: false, isLoading: false, loadingNumber: 0)
    @Published var ColorScheme = colorScheme(
        words: Color( #colorLiteral(red: 0.3176293969, green: 0.3866314292, blue: 0.4381694794, alpha: 1) ) , backgroundOne:  Color( #colorLiteral(red: 0.736397624, green: 0.852484405, blue: 0.8485863805, alpha: 1) )  , backgroundTwo:  Color( #colorLiteral(red: 0.768197, green: 0.8950389028, blue: 0.8317549825, alpha: 1) )  , tiles:  Color( #colorLiteral(red: 0.7437219024, green: 0.8593150377, blue: 0.8665470481, alpha: 1) )  , accentOne:  Color( #colorLiteral(red: 0.9369754195, green: 0.8287350535, blue: 0.730240047, alpha: 1) )  , accentTwo:  Color( #colorLiteral(red: 0.9197416902, green: 0.7386668921, blue: 0.712102592, alpha: 1) )  , neutralOne:  Color( #colorLiteral(red: 0.9595448375, green: 0.9865084291, blue: 0.9864633679, alpha: 1) )  , neutralTwo:  Color( #colorLiteral(red: 0.9185807109, green: 0.9558623433, blue: 0.9594259858, alpha: 1) )
    )
    @Published var TESTING_HighlightBackGround = false
    @Published var mySpring = Animation.spring(response: 0.9, dampingFraction: 1, blendDuration: 1)
    @Published var pokedex = [Result]()
    @Published var PokeTeam = [Pokemon?]()
    @Published var CurrentPokemonForStatPage : Pokemon?
    @Published var CurrentPokemonAbilityResource = [AbilityResource?]()
    @Published var CurrentPokemonSpeciesResource : SpeciesResource?
    @Published var CurrentPokemonEvolutionChain : EvolutionChain?
    
    @Published var PokemonArray : [Pokemon] = []
    @Published var ImagePokemonDictionary : [String:URL] = [:]
    @Published var PokemonTypeArray : [Pokemon] = []
    @Published var PokemonTypeResource : TypeResource?
    @Published var pokedexData : ListOfPokemon?
    @Published var searchPokemon = ""
    @Published var pokemonImageCache = CacheViewModel()
    @Published var pokemonSearchData = PokemonSearchData(pokeballAngle: 0.0, pokeballOffset: -100, pokemonOpacity: 1)
    @Published var appearanceData = AppearanceData(activeAppearances: ["Grid", "Light Mode"], listOffset: 200 , gridOffset: 0, lightOffset: 0, darkOffset: 200)
    @Published var specialEvolutionData = SpecialEvolutionData(chosenEvolution: [
        "Mega Evolution" : false, "Gigantimax Evolution" : false
    ], specialEvoOffsetMega : 200,specialEvoOffsetGiga : 200)
    @Published var pokemonGenData = PokemonGenData(allGens: [
        "red" : "Gen 1",
        "ruby" : "Gen 2",
        "gold" : "Gen 3",
        "diamond" : "Gen 4",
        "black" : "Gen 5",
        "x-y" : "Gen 6",
        "sun-moon" : "Gen 7",
        "sword-shield" : "Gen 8",
        "All" : "none"
    ],chosenGen: ["All", "red", "ruby", "gold", "diamond", "black", "x-y", "sun-moon", "sword-shield"],
                                                   allGensTwo: ["none", "red", "ruby", "gold", "diamond", "black", "x-y", "sun-moon", "sword-shield"])
    @Published var pokemonStatData = PokemonStatData(allStats: [
        "hp","attack","defense","special-attack","special-defense","speed"
    ], shortStats: ["HP", "ATK", "DEF", "SATK", "SDEF", "SPD"], chosenStat: "none", circleOffset : [0,0,0,0,0,0], circleOpacity: 1.0, chosenMarker: 0)
    @Published var pokemonTypeData = PokemonTypeData(allTypes : [
         "normal", "fire", "water", "grass", "electric", "ice","fighting", "poison", "ground", "flying", "psychic",
        "bug", "rock", "ghost", "dark", "dragon", "steel", "fairy"
    ], typeColors: [
        Color(#colorLiteral(red: 0.6737250686, green: 0.6985528469, blue: 0.7216627598, alpha: 1)), Color(#colorLiteral(red: 0.9963847995, green: 0.7118294835, blue: 0.4604790211, alpha: 1)), Color(#colorLiteral(red: 0.4710494876, green: 0.7141628861, blue: 0.9085357189, alpha: 1)), Color(#colorLiteral(red: 0.4926331639, green: 0.8383826613, blue: 0.5474827886, alpha: 1)), Color(#colorLiteral(red: 0.9935126901, green: 0.9184910059, blue: 0.5402776003, alpha: 1)), Color(#colorLiteral(red: 0.5575968623, green: 0.8880816102, blue: 0.8468908668, alpha: 1)), Color(#colorLiteral(red: 0.915376246, green: 0.4151825905, blue: 0.5862329602, alpha: 1)), Color(#colorLiteral(red: 0.8034152389, green: 0.5933796763, blue: 0.8691999316, alpha: 1)), Color(#colorLiteral(red: 0.9286933541, green: 0.6336356401, blue: 0.483270824, alpha: 1)), Color(#colorLiteral(red: 0.6433954835, green: 0.7469757795, blue: 0.914516151, alpha: 1)), Color(#colorLiteral(red: 0.9905878901, green: 0.6422992349, blue: 0.6783543229, alpha: 1)),
        Color(#colorLiteral(red: 0.7150732875, green: 0.863840878, blue: 0.4004991651, alpha: 1)), Color(#colorLiteral(red: 0.8296057582, green: 0.7761716247, blue: 0.6365329623, alpha: 1)),Color(#colorLiteral(red: 0.2937060297, green: 0.4183290601, blue: 0.7049863935, alpha: 1)), Color(#colorLiteral(red: 0.428347528, green: 0.4067060351, blue: 0.4705001116, alpha: 1)), Color(#colorLiteral(red: 0.1559405625, green: 0.5092394948, blue: 0.8172630668, alpha: 1)), Color(#colorLiteral(red: 0.630789578, green: 0.7453705072, blue: 0.7944942117, alpha: 1)),  Color(#colorLiteral(red: 0.9926719069, green: 0.7600913644, blue: 0.9566900134, alpha: 1)),
    ], chosenTypes: ["none"], arraySelectionInt: 0, index: 1, indexTwo: 1)
    @Published var columnData = ColumnData(columns : [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ], isGrid: true)
    
    // MARK: GARBAGE
    @Published var checkBoxAnimations = allGenAnimations(isOffset: 100, isOpacity: 0)
    @Published var store = Store()
//    @Published var about = About()
    @Published var snappedItem = 0.0
    @Published var draggingItem = 1.0

    @Published var isLightMode = false
    
    
    init(){
        print("WELCOME TO POKETEAM!! by Dijay Synclaire")
       loadData()
       
    }
}
class secondData : ObservableObject {
    @Published var ColorScheme = [
        #colorLiteral(red: 0.1442590058, green: 0.1522315443, blue: 0.2122519016, alpha: 1) ,  #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1) , #colorLiteral(red: 0.9052584767, green: 0.9415059686, blue: 0.9920620322, alpha: 1) , #colorLiteral(red: 0.9373065212, green: 0.9373065212, blue: 0.9373065212, alpha: 1) ,  #colorLiteral(red: 0.5153698325, green: 0.5021851659, blue: 0.5675694346, alpha: 1) ,  #colorLiteral(red: 0.997874558, green: 0.7377631664, blue: 0.7612046003, alpha: 1) ,  #colorLiteral(red: 0.9694761634, green: 0.9694761634, blue: 0.9694761634, alpha: 1) ,  #colorLiteral(red: 0.7057445011, green: 0.6954870821, blue: 0.7172181681, alpha: 1) ,
     ]
    @Published var ColorScheme2 = [
        #colorLiteral(red: 0.9052584767, green: 0.9415059686, blue: 0.9920620322, alpha: 1) ,  #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1) , #colorLiteral(red: 0.1442590058, green: 0.1522315443, blue: 0.2122519016, alpha: 1) ,  #colorLiteral(red: 0.9373065212, green: 0.9373065212, blue: 0.9373065212, alpha: 1) ,   #colorLiteral(red: 0.997874558, green: 0.7377631664, blue: 0.7612046003, alpha: 1) ,  #colorLiteral(red: 0.5153698325, green: 0.5021851659, blue: 0.5675694346, alpha: 1) , #colorLiteral(red: 0.9694761634, green: 0.9694761634, blue: 0.9694761634, alpha: 1) ,  #colorLiteral(red: 0.7057445011, green: 0.6954870821, blue: 0.7172181681, alpha: 1) ,  #colorLiteral(red: 0.4856000543, green: 0.5362898111, blue: 0.6520786285, alpha: 1)  
     ]
}


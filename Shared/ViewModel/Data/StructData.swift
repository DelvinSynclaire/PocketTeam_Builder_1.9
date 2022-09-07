//
//  StructData.swift
//  PokeTeam_1.8
//
//  Created by Delvin Cockroft on 8/24/22.
//

import Foundation
import SwiftUI

struct ColumnData{
    var columns : [GridItem]
    var isGrid : Bool
}

struct PokemonSearchData {
    var pokeballAngle : Double
    var pokeballOffset : CGFloat
    var pokemonOpacity : Double
}
struct PokemonTypeData {
    var allTypes : [String]
    var typeColors : [Color]
    var chosenTypes: [String]
    var arraySelectionInt : Int
    var index: Array<String>.Index?
    var indexTwo: Array<String>.Index?
}
struct PokemonStatData: Hashable{
    var allStats : [String]
    var shortStats : [String]
    var chosenStat : String
    var circleOffset : [CGFloat]
    var circleOpacity : Double
    var chosenMarker : Int
}
struct PokemonGenData{
    var allGens : [String:String]
    var chosenGen : [String]
    var allGensTwo : [String]

    
}
struct generationDef : Hashable{
    var genNumber : String
    var genName : String
}

struct SpecialEvolutionData{
    var chosenEvolution : [String:Bool]
    var specialEvoOffsetMega: CGFloat
    var specialEvoOffsetGiga: CGFloat
}
struct AppearanceData{
    var activeAppearances : [String]
    var listOffset: CGFloat
    var gridOffset: CGFloat
    var lightOffset: CGFloat
    var darkOffset: CGFloat
}
struct PokemonUIImage{
    var pokemonImage : UIImage
    var pokemonName : String
}

struct PageData {
    var pageNumber : Int
    var pageHeight : CGFloat
    var pageWidth : CGFloat
    var maskOffsetOne : CGFloat
    var maskOffsetTwo : CGFloat
    var maskIsShowing : Bool
    var isLoading: Bool
    var loadingNumber : Int
}

// MARK: - Welcome
struct ListOfPokemon: Codable {
    let count: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let name: String
    let url: String
}


// MARK: - Pokemon
struct Pokemon: Codable {
    
    let id: Int
    let name: String
    let sprites: Sprites
    let abilities: [Ability]
    let order: Int
    let stats: [Stat]
    let types: [TypeElement]
    let weight: Int
    let height: Int
    let base_experience: Int
    let forms: [Species]
    let other: Other?
    let game_indices: [GameIndex]
    let moves: [Move]
    let species : Species
}
// MARK: - Move
struct Move: Codable {
    let move: Species
    let version_group_details: [VersionGroupDetail]
}
// MARK: - VersionGroupDetail
struct VersionGroupDetail: Codable {
    let level_learned_at: Int
    let move_learn_method, version_group: Species
}
struct GameIndex: Codable {
    let game_index: Int
    let version: Species
}
// MARK: - Ability
struct Ability: Codable {
    let ability: Species
    let slot: Int
}
// MARK: - Ability Resource
struct AbilityResource: Codable, Hashable {
    let effect_entries : [Entry]
    let names : [Names]
}
struct Entry : Codable, Hashable{
    let effect : String
    let language : Species
    let short_effect : String
}
struct Names : Codable, Hashable{
    let language : Species
    let name : String
}

// MARK: - Species resource
struct SpeciesResource: Codable{
    let base_happiness: Int
    let capture_rate: Int
    let flavor_text_entries: [FlavorText]
    let evolution_chain : evolutionURL
    let genera : [Genera]
    let generation : Species
    let name : String
    let egg_groups : [Species]
}
struct FlavorText: Codable{
    let flavor_text: String
    let language: Species
    let version : Species
}
struct Genera : Codable{
    let genus: String
    let language: Species
}

// MARK: - Evolution Chain
struct EvolutionChain: Codable{
    var chain : Chain
}
struct Chain: Codable{
    var evolves_to : [EvolutionDetails]
    var species: Species
}
struct EvolutionDetails: Codable{
    var evolves_to: [EvolutionDetails]
    var species : Species
}
 
struct evolutionURL : Codable{
    var url: String
}
// MARK: - Other
struct Other: Codable {
    let official_artwork: OfficialArtwork

    enum CodingKeys: String, CodingKey {
        case official_artwork = "official-artwork"
    }
}
struct OfficialArtwork: Codable{
    let front_default: String
}

// MARK: - Species
struct Species: Codable, Hashable {
    let name: String
    let url: String
}

// MARK: - TypeElement
struct TypeElement: Codable, Hashable {
    let slot: Int
    let type: Species
}

// MARK: - Type Resource
struct TypeResource: Codable{
    let move_damage_class: Species
    let name: String
    let damage_relations: DamageRelation
}
struct DamageRelation: Codable{
    let double_damage_from: [Species]
    let double_damage_to: [Species]
    let half_damage_from: [Species]
    let half_damage_to: [Species]
    let no_damage_from: [Species]
    let no_damage_to: [Species]
}

// MARK: - Sprites
class Sprites: Codable {
    let front_default: String
}
// MARK: - Stat
struct Stat: Codable {
    let base_stat, effort: Int
    let stat: Species

}


// MARK: Garbage
struct allGenAnimations {
    var isOffset: CGFloat
    var isOpacity : Double
}
struct AnimationSetupForImage {
    var x: CGFloat
    var y: CGFloat
    var animaiton : Animation
    var delay : DispatchTime
}
struct Item: Identifiable {
    var id: Int
    var title: String
    var color: Color
    var dragID : Double
    var content: AnyView
}

struct AboutItem: Identifiable{
    var id: Int
    var title: String
    var info: Any
}
struct FilterDataSet: Identifiable{
    var id : Int
    var title : String
    var Data : [String]
    var Func : ()
}

struct SheetBindingVariables{
    var isPresented : Bool
    var myOffset : CGSize
    var isSheetContent : Int
}
struct FilterBasics {
    var isBold : Bool
    var numPadding : CGFloat
    var numColor : Color
    var textAlignment : String
}

struct colorScheme {
    var  words : Color
    var backgroundOne : Color
    var backgroundTwo : Color
    var tiles :Color
    var accentOne :Color
    var accentTwo : Color
    var neutralOne : Color
    var neutralTwo : Color
}

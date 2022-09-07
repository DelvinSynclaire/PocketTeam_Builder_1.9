//
//  StatisticsSubView.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 8/29/22.
//

import Foundation
import SwiftUI

struct StatisticsSubView : View {
    @EnvironmentObject var mainData: MainData

    var body: some View {

        ZStack{
            VStack{
                ForEach(mainData.pokemonStatData.allStats, id: \.self){ stat in
                    let index = mainData.pokemonStatData.allStats.firstIndex(of: stat)
                    let animationSetup = AnimationSetupForImage(x: (-mainData.pageData.pageWidth / 1.8) * CGFloat(Double(index!) + 0.5), y: 0, animaiton: mainData.mySpring, delay: DispatchTime.now() + 0.75)
                    
                    mainData.StatBar(name: mainData.pokemonStatData.shortStats[index!], stat: mainData.CurrentPokemonForStatPage!.stats[index!].base_stat, AnimationSetup: animationSetup)
                }
                mainData.HeaderTextView(stringContent: "Type Effectivness", textAlignment: "left", isBold: true, numPadding: 0, numColor: mainData.ColorScheme.words, typeFont: .title3).padding(.top).offset(x: -5)
                TypeAdvantagesAndDisadvantages().padding(.top)
            }
        }
    }
}

struct TypeAdvantagesAndDisadvantages: View {
    @EnvironmentObject var mainData: MainData

    var body: some View{
        let animationSetupOne = AnimationSetupForImage(x: 100, y: 0, animaiton: mainData.mySpring, delay: DispatchTime.now() + 0.1)
        let animationSetupTwo = AnimationSetupForImage(x: 100, y: 0, animaiton: mainData.mySpring, delay: DispatchTime.now() + 0.43)
        let animationSetupThree = AnimationSetupForImage(x: 100, y: 0, animaiton: mainData.mySpring, delay: DispatchTime.now() + 0.76)
        let animationSetupFour = AnimationSetupForImage(x: 100, y: 0, animaiton: mainData.mySpring, delay: DispatchTime.now() + 1)
        let animationSetupFive = AnimationSetupForImage(x: 100, y: 0, animaiton: mainData.mySpring, delay: DispatchTime.now() + 1.33)
        
        VStack(alignment: .leading){
            mainData.TypeEffectView(Effect: mainData.PokemonTypeResource!.damage_relations.double_damage_to, title: "2x Given", animationSetup: animationSetupOne)
            mainData.TypeEffectView(Effect: mainData.PokemonTypeResource!.damage_relations.double_damage_from,title: "2x Taken", animationSetup: animationSetupTwo)
            mainData.TypeEffectView(Effect: mainData.PokemonTypeResource!.damage_relations.half_damage_to,title: "1/2x Given", animationSetup: animationSetupThree)
            mainData.TypeEffectView(Effect: mainData.PokemonTypeResource!.damage_relations.half_damage_from,title: "1/2x Taken", animationSetup: animationSetupFour)
            mainData.TypeEffectView(Effect: mainData.PokemonTypeResource!.damage_relations.no_damage_to,title: "0x Given", animationSetup: animationSetupFive)
        }
        .mask(
            Rectangle()
                .frame(width: mainData.pageData.pageWidth)
        )
    }
}

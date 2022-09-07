//
//  AboutSubView.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 8/30/22.
//

import Foundation
import SwiftUI

struct AboutSubView : View {
    @EnvironmentObject var mainData: MainData
    @State private var aboutItems = [AboutItem]()
    @State private var eggGroup : String?

    var body: some View {
        let noFlavorText = FlavorText(flavor_text: "No Info Available", language: Species(name: "nope", url: "double nope"), version: Species(name: "nope", url: "double nope"))
        let flavorText = "\(mainData.findEnglishFilter(text: mainData.CurrentPokemonSpeciesResource?.flavor_text_entries ?? [noFlavorText]))"

        ZStack{
            VStack{
              // Pokedex Entry
                VStack{
                    mainData.HeaderTextView(stringContent: "Pokedex Entry", textAlignment: "left", isBold: true, numPadding: 0, numColor: mainData.ColorScheme.words, typeFont: .title3)
                    HStack{
                        mainData.TextSetup(stringContent: "\(mainData.removeReturnCharacters(text:flavorText))", typeFont: .subheadline, isBold: false, numOffset: 0, numOffsetY: 0, numColor: mainData.ColorScheme.words).lineLimit(2).padding(.bottom)
                        Spacer()
                    }
                    .frame( height: 55)
                    
                }
                
                VStack{
                    // Basic Info
                    mainData.HeaderTextView(stringContent: "Basic Info", textAlignment: "left", isBold: true, numPadding: 0, numColor: mainData.ColorScheme.words, typeFont: .title3).padding(.bottom)
                    /// Height , Weight, Egg Groups, Catch Rate, Base Friendship, Base XP Yield
                    ForEach(aboutItems, id: \.id){ abouts in
                        let animationSetup = AnimationSetupForImage(x: 0, y: CGFloat(50 + (abouts.id * 25)), animaiton: mainData.mySpring, delay: DispatchTime.now() + 0.2)
                        
                        mainData.AboutBar(name: "\(abouts.title)", stat: abouts.info, AnimationSetup: animationSetup)
                        Divider()
                    }
                }
            }
        }
        .onAppear{
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                withAnimation(mainData.mySpring){
                    if mainData.CurrentPokemonSpeciesResource?.egg_groups[0].name != nil {
                        aboutItems = [
                            AboutItem(id: 0, title: "Height", info: mainData.CurrentPokemonForStatPage?.height ?? 0),
                            AboutItem(id: 1, title: "Weight", info: mainData.CurrentPokemonForStatPage?.weight ?? 0),
                            AboutItem(id: 2, title: "Egg Groups", info: mainData.CurrentPokemonSpeciesResource?.egg_groups ?? 0),
                            AboutItem(id: 3, title: "Catch Rate", info: mainData.CurrentPokemonSpeciesResource?.capture_rate ?? 10),
                            AboutItem(id: 4, title: "Base Friendship", info: mainData.CurrentPokemonSpeciesResource?.base_happiness ?? 10),
                            AboutItem(id: 5, title: "Base XP Yield", info: mainData.CurrentPokemonForStatPage?.base_experience ?? 0)
                        ]
                        timer.invalidate()
                    }
                }
            }
            
            
            

        }
    }
}



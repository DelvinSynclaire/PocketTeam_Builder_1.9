//
//  EvolutionsSubView.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 8/30/22.
//

import Foundation
import SwiftUI

struct EvolutionsSubView: View {
    @EnvironmentObject var mainData: MainData

    var body: some View{
        let animationSetup = AnimationSetupForImage(x: 0, y: 150, animaiton: mainData.mySpring, delay: DispatchTime.now() + 0.1)

        VStack{
            ForEach(mainData.callEvolutions(evoChain: mainData.CurrentPokemonEvolutionChain!), id : \.self){ chain in
                let index = mainData.callEvolutions(evoChain: mainData.CurrentPokemonEvolutionChain!).firstIndex(of: chain)
                HStack{
                    if index! % 2 == 1 {
                        Spacer()
                    }

                    if index! == 0{
                        /// circle and circle border for pokemon
                        mainData.PokemonCircle(chain: chain, animationSetup: animationSetup).offset(y: 50)
                        /// name of pokemon in evolution chain
                        mainData.TextSetup(stringContent: "\(chain.capitalizingFirstLetter())", typeFont: .headline, isBold: true, numOffset: 0, numOffsetY: 0, numColor: mainData.ColorScheme.words).offset(y: 50)
                        /// images of the types the pokkemon has : being called by name
                        mainData.PokemonTypesByNameView(chain: chain, animationSetup: animationSetup).offset(y: 50)
                    }
                    if index! == 1{
                        /// name of pokemon in evolution chain
                        mainData.TextSetup(stringContent: "\(chain.capitalizingFirstLetter())", typeFont: .headline, isBold: true, numOffset: 0, numOffsetY: 0, numColor: mainData.ColorScheme.words)
                        /// images of the types the pokkemon has : being called by name
                        mainData.PokemonTypesByNameView(chain: chain, animationSetup: animationSetup)
                        /// circle and circle border for pokemon
                        mainData.PokemonCircle(chain: chain, animationSetup: animationSetup)

                    }
                    if index! == 2 {
                        /// circle and circle border for pokemon
                        mainData.PokemonCircle(chain: chain, animationSetup: animationSetup).offset(y: -50)
                        /// name of pokemon in evolution chain
                        mainData.TextSetup(stringContent: "\(chain.capitalizingFirstLetter())", typeFont: .headline, isBold: true, numOffset: 0, numOffsetY: 0, numColor: mainData.ColorScheme.words).offset(y: -50)
                        /// images of the types the pokkemon has : being called by name
                        mainData.PokemonTypesByNameView(chain: chain, animationSetup: animationSetup).offset(y: -50)
                    }
                    
                    
                    if index! % 2 != 1 {
                        Spacer()
                    }
                }
            }
        }
    }
}

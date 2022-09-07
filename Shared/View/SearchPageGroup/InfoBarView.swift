//
//  InfoBarView.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 9/2/22.
//

import Foundation
import SwiftUI

struct InfoBar: View {
    @EnvironmentObject var mainData: MainData
    
    var body: some View {
        VStack{
            Spacer()
            PokemonNumber()
            Spacer()
            DexDisplayView()
            Spacer()
            InfoBarView()
            Spacer()
        }
        .background(
            Rectangle()
                .fill(mainData.ColorScheme.accentTwo)
                .frame(width: 1)
        )
       
    }
}

struct PokemonNumber: View {
    @EnvironmentObject var mainData: MainData

    var body: some View{
        if mainData.pokemonTypeData.arraySelectionInt == 0{
            mainData.TextSetup(stringContent: "\(mainData.PokemonArray.count) Pokmeon", typeFont: .body, isBold: false, numOffset: 0, numOffsetY: 0, numColor: mainData.ColorScheme.words).rotationEffect(.degrees(-90)).fixedSize().background(
                mainData.ColorScheme.neutralOne
                    .frame(width: 5, height: 150)
            )
        } else {
            mainData.TextSetup(stringContent: "\(mainData.PokemonTypeArray.count) pokemon", typeFont: .headline, isBold: false, numOffset: 0, numOffsetY: 0, numColor: mainData.ColorScheme.words).rotationEffect(.degrees(-90)).fixedSize().background(
                mainData.ColorScheme.neutralOne
                    .frame(width: 5, height: 150)
            )
        }
    }
}

struct DexDisplayView : View {
    @EnvironmentObject var mainData: MainData

    var body: some View{
            if mainData.pokemonStatData.chosenStat != "none"{
                ZStack{
                    mainData.ColorScheme.neutralOne
                        .frame(width: 5, height: 80)
                    mainData.TextSetup(stringContent: "\(mainData.pokemonStatData.chosenStat.capitalizingFirstLetter())", typeFont: .body, isBold: true, numOffset: 0, numOffsetY: 0, numColor: mainData.ColorScheme.words).rotationEffect(.degrees(-90)).fixedSize().frame(height: 50)
                }
                .offsetAxisAnimation(x: 0, y: 500, mySpring: mainData.mySpring, delay: DispatchTime.now())

            }

    }
}

struct InfoBarView : View {
    @EnvironmentObject var mainData: MainData

    var body: some View{
        VStack{
            let pokemonTypes = mainData.pokemonTypeData.chosenTypes
            let pokemonTypeCount = pokemonTypes.count
         
            if pokemonTypeCount == 4{
                mainData.TextSetup(stringContent: "Multiple Types", typeFont: .title3, isBold: true, numOffset: 0, numOffsetY: 0, numColor: mainData.ColorScheme.words).rotationEffect(.degrees(-90)).fixedSize().frame(height: 50)
            } else if pokemonTypeCount == 3{
                mainData.TextSetup(stringContent: "\(pokemonTypes[1].capitalizingFirstLetter()) & \(pokemonTypes[2].capitalizingFirstLetter())", typeFont: .title3, isBold: true, numOffset: 0, numOffsetY: 0, numColor: mainData.ColorScheme.words).rotationEffect(.degrees(-90)).fixedSize().frame(height: 50)
            } else if pokemonTypeCount == 2 {
                mainData.TextSetup(stringContent: "\(pokemonTypes[1].capitalizingFirstLetter())", typeFont: .title3, isBold: true, numOffset: 0, numOffsetY: 0, numColor: mainData.ColorScheme.words).rotationEffect(.degrees(-90)).fixedSize().frame(height: 50)
            } else if pokemonTypeCount == 1 {
                mainData.TextSetup(stringContent: "National Dex", typeFont: .title3, isBold: true, numOffset: 0, numOffsetY: 0, numColor: mainData.ColorScheme.words).rotationEffect(.degrees(-90)).fixedSize().frame(height: 50)
            }
              
        }
        .offsetAxisAnimation(x: 0, y: 500, mySpring: mainData.mySpring, delay: DispatchTime.now())
        .background(
        mainData.ColorScheme.neutralOne
            .frame(width: 5, height: mainData.pokemonTypeData.chosenTypes.count == 3 ? 175 : 125)
        )
    }
}


//
//  whatever.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 9/2/22.
//

import Foundation
import SwiftUI

struct whaterv : View {
    @EnvironmentObject var mainData: MainData

    var body: some View{
        
        if mainData.pokemonTypeData.arraySelectionInt == 0{
            Text("National Dex")
                .font(.title3)
                .bold()
                .foregroundColor(Color(mainData.ColorScheme[4]))
                .lineLimit(1)
                .rotationEffect(.degrees(-90))
        } else {
            // Type change
            
            if mainData.pokemonTypeData.chosenTypes.count == 3{
                Text("\(mainData.pokemonTypeData.chosenTypes[1].capitalizingFirstLetter()) & \(mainData.pokemonTypeData.chosenTypes[2].capitalizingFirstLetter())")
                    .font(.body)
                    .bold()
                    .foregroundColor(Color(mainData.ColorScheme[4]))
                    .lineLimit(1)
                    .rotationEffect(.degrees(-90))
            } else if mainData.pokemonTypeData.chosenTypes.count == 2 {
                Text("\(mainData.pokemonTypeData.chosenTypes[1].capitalizingFirstLetter()) Type")
                    .font(.title3)
                    .bold()
                    .foregroundColor(Color(mainData.ColorScheme[4]))
                    .lineLimit(1)
                    .rotationEffect(.degrees(-90))
            } else {
                Text("Multiple Types")
                    .font(.title3)
                    .bold()
                    .foregroundColor(Color(mainData.ColorScheme[4]))
                    .lineLimit(1)
                    .rotationEffect(.degrees(-90))
            }
        }
    }
}

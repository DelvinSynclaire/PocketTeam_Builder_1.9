//
//  MainSearchPage.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 9/2/22.
//

import Foundation
import SwiftUI

struct SearchPage: View{
    @EnvironmentObject var mainData: MainData
    @State var isReady = false
    
    var body: some View{
        ZStack{
            VStack{
            // Back Button, Search Bar, and Filter Button
            HeaderForSearchPage()
                .frame(height: mainData.pageData.pageHeight / 16)
            // Bar to show team (if there is one)
            if mainData.PokeTeam.count > 0 {
                TheSandra()
                    .offsetAxisAnimation(x: 0, y: -100, mySpring: mainData.mySpring, delay: DispatchTime.now() + 1.5)
                    .mask(
                        RoundedRectangle(cornerRadius: 10)
                    )
            }
            // Info Bar and Pokemon Tile View
            if mainData.PokemonArray.count > 1050 {
                HStack{
                    InfoBar()
                        .offset(x: 10)
                        .frame(width: mainData.pageData.pageWidth / 12)
                    Spacer()
                    PokemonView(isReady: $isReady)
                        .frame(width: mainData.pageData.pageWidth / 1.2)
                }
                .padding(.top)
            } else {
                Text("NO IHNFO")
            }
        }
                .frame(width: mainData.pageData.pageWidth / 1.1)
            VStack{
            Spacer()
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(mainData.ColorScheme.neutralOne)
                .frame(width: mainData.pageData.pageWidth, height: 25)
        }
        }
        .background(
            mainData.ColorScheme.neutralOne
            .ignoresSafeArea()
        )
        .frame(width: mainData.pageData.pageWidth, height: mainData.pageData.pageHeight)
        if mainData.PokemonArray.count != 1113{
            loadingPage()
        }
    }
}

struct TheSandra: View {
    @EnvironmentObject var mainData: MainData

    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 2)
                .foregroundColor(mainData.appearanceData.activeAppearances.contains("Dark Mode") ? mainData.ColorScheme.neutralTwo : mainData.ColorScheme.words)
                .frame(height: 55)
            HStack{
                ForEach(mainData.PokeTeam, id: \.?.id){ teammate in
                    let index = mainData.PokeTeam.firstIndex(where: {$0!.name == teammate!.name})! + 1
                    ZStack{
                        let animationSetup = AnimationSetupForImage(x: 0, y: 0, animaiton: mainData.mySpring, delay: DispatchTime.now())

                        Circle()
                            .fill(mainData.appearanceData.activeAppearances.contains("Dark Mode") ? mainData.ColorScheme.words : mainData.ColorScheme.tiles)
                            .frame(width: 40, height: 40)
                        mainData.ImageSetup(isProgramImage: true, stringImage: "\(teammate!.name)", stringURLImage: "\(teammate!.name)", imageWidth: 55, imageHeight: 5, AnimationSetup: animationSetup)
                    }
                    .offsetAxisAnimation(x: 0, y: -50 * CGFloat(index * 20), mySpring: mainData.mySpring, delay: DispatchTime.now() + 1.5)
                    
                }
                Spacer()
            }
            .frame(width: mainData.pageData.pageWidth / 1.3)
        }
    }
}

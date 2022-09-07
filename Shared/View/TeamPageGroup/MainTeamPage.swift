//
//  MainTeamPage.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 9/2/22.
//

import Foundation
import SwiftUI

struct MainTeamPage: View {
    @EnvironmentObject var mainData: MainData

    var body: some View{
        ZStack{
            VStack{
                // Header
                HeaderForTeamPage()
                .padding(.bottom)
                
                ScrollView{
                    ForEach(mainData.callPokeTeamNames(), id: \.self){ teammate in
                        let animationSetup = AnimationSetupForImage(x: 0, y: 0, animaiton: mainData.mySpring, delay: DispatchTime.now())
                        let poke = mainData.callPokemonByName(poke: teammate)
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .fill(mainData.ColorScheme.backgroundOne)
                                .frame(height: mainData.pageData.pageHeight / 4)
                            // Pokemon Information
                            mainData.TeamPageCard(teammate: teammate, poke: poke, animationSetup: animationSetup)
                        }
                    }
                }
              
                if mainData.callPokeTeamNames().count < 6 {
                    Spacer()
                }
            }
            .frame(width: mainData.pageData.pageWidth / 1.1)
        }
        .padding(.top)
        .background(
            mainData.ColorScheme.neutralOne
                .ignoresSafeArea()
                .frame(width: mainData.pageData.pageWidth, height: mainData.pageData.pageHeight)
        )
    }
}


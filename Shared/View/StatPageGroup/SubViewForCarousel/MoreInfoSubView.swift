//
//  MoreInfoSubView.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 9/1/22.
//

import Foundation
import SwiftUI

struct MoreInfoSubView: View {
    @EnvironmentObject var mainData: MainData

    var body: some View{
        let _ = AnimationSetupForImage(x: 0, y: 150, animaiton: mainData.mySpring, delay: DispatchTime.now() + 0.1)

        VStack(alignment: .leading){
            mainData.HeaderTextView(stringContent: "Abilities", textAlignment: "left", isBold: true, numPadding: 0, numColor: mainData.ColorScheme.words, typeFont: .title3).padding(.bottom)
            ForEach(mainData.CurrentPokemonAbilityResource, id: \.self){ resource in
                mainData.AbilityNotice(resource: resource)
            }
        }
       
    }
}

//
//  TeamBarView.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 9/2/22.
//

import Foundation
import SwiftUI

struct TeamBar: View {
    @EnvironmentObject var mainData: MainData

    var body: some View{
        ZStack {
            if mainData.PokeTeam.count > 0 {
                ForEach(mainData.callPokeTeamNames(), id: \.self){ teammates in
                    ZStack{
                        Circle()
                            .frame(width: 25, height: 25)
                    }
                    .background(mainData.ColorScheme.backgroundOne)
                    .frame(width: mainData.pageData.pageWidth, height: mainData.pageData.pageHeight / 12)
                    
                }
            }
        }
        .background(mainData.ColorScheme.backgroundOne)
        .frame(width: mainData.pageData.pageWidth, height: mainData.pageData.pageHeight / 12)

    }
}

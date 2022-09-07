//
//  HeaderForTeamPage.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 9/6/22.
//

import Foundation
import SwiftUI

struct HeaderForTeamPage : View {
    @EnvironmentObject var mainData: MainData

    var body: some View{
        HStack{
            VStack(alignment: .leading){
                mainData.HeaderTextView(stringContent: "PokeTeam", textAlignment: "left", isBold: true, numPadding: 0, numColor: mainData.ColorScheme.words, typeFont: .largeTitle)
                mainData.TextSetup(stringContent: "Make the Team of Your Dreams", typeFont: .headline, isBold: false, numOffset: 0, numOffsetY: 0, numColor: mainData.ColorScheme.words)
            }
           
            Spacer()
            // Button to move to search page
                Button{
                    mainData.pageData.pageNumber = 1
                }label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(mainData.ColorScheme.words)
                            .frame(width: 35, height: 35)
                        mainData.SystemImageSetup(numColor: mainData.ColorScheme.neutralOne, systemImage: "magnifyingglass", imageWidth: 15, imageHeight: 15)
                    }
                }
        }

    }
}

//
//  Header.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 9/4/22.
//

import Foundation
import SwiftUI

// HEADER for fiter page
struct HeaderForFilterPage: View {
    @EnvironmentObject var mainData: MainData
    @ObservedObject var filterData : FilterDataClass

    var body: some View{
            HStack{
                // FILTER HEADER
                Button{
                    mainData.pageData.pageNumber = 1
                }label: {
                    ZStack{
                        filterData.SystemImageSetup(numColor: mainData.appearanceData.activeAppearances.contains("Dark Mode") ? mainData.ColorScheme.words : mainData.ColorScheme.neutralOne, systemImage: "chevron.left", imageWidth: 15, imageHeight: 15).offset(x: -50)
                        filterData.TextButtonSetup(numColor: mainData.appearanceData.activeAppearances.contains("Dark Mode") ? mainData.ColorScheme.words : mainData.ColorScheme.neutralOne, stringContent: "Back", textWidth: mainData.pageData.pageWidth / 4, textHeight: mainData.pageData.pageHeight / 20, typeFont: .headline)
                    }
                   
                }
                Spacer()
                filterData.TextSetup(stringContent: "Filters", typeFont: .title, isBold: true, numOffset: 0, numOffsetY: 0, numColor: mainData.appearanceData.activeAppearances.contains("Dark Mode") ? mainData.ColorScheme.words : mainData.ColorScheme.neutralOne)
                Spacer()
                Button{
                    mainData.resetFilter()
                }label: {
                    filterData.TextButtonSetup(numColor: mainData.appearanceData.activeAppearances.contains("Dark Mode") ? mainData.ColorScheme.words : mainData.ColorScheme.neutralOne, stringContent: "Reset", textWidth: mainData.pageData.pageWidth / 4, textHeight: mainData.pageData.pageHeight / 20, typeFont: .headline)
                }
               
            }
            .padding(.bottom)
            .frame(width: mainData.pageData.pageWidth / 1.1)
    }
}


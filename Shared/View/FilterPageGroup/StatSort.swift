//
//  StatSort.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 9/4/22.
//

import Foundation
import SwiftUI

// sort by stat
struct StatFilter: View {
    @EnvironmentObject var mainData: MainData
    @ObservedObject var filterData : FilterDataClass


    var body: some View {
        VStack(alignment: .leading){
            HStack{
                mainData.HeaderTextView( stringContent: "Stat Sort", textAlignment: "\(filterData.filterBasics.textAlignment)",isBold: filterData.filterBasics.isBold,numPadding: filterData.filterBasics.numPadding,numColor: filterData.filterBasics.numColor, typeFont: .title2)
                Spacer()
                // VIEW ALL button in Filter page: More Info -> MainData Folder -> View Functions
                Button{
                    filterData.sheetBindingVariables.isPresented = true
                    filterData.sheetBindingVariables.isSheetContent = 3
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                        withAnimation(mainData.mySpring){
                            filterData.sheetBindingVariables.myOffset = .zero
                        }
                    }
                    print("View All for Stat pressed! : More Info")
                }label: {
                    mainData.HeaderTextView(stringContent: "View All", textAlignment: "none", isBold: false, numPadding: 5, numColor: mainData.ColorScheme.words, typeFont: .headline)
                    mainData.SystemImageSetup(numColor: mainData.ColorScheme.words, systemImage: "chevron.right", imageWidth: mainData.pageData.pageWidth / 30, imageHeight: mainData.pageData.pageWidth / 30)
                }
            }
            ScrollView(.horizontal){
                HStack{
                    
                    mainData.FilterNotice(isActive: true, isBackground: 1, stringContent: "\(mainData.pokemonStatData.chosenStat.capitalizingFirstLetter())", noticeWidth: mainData.pageData.pageWidth / 5, noticeFont: .subheadline, textColor: mainData.ColorScheme.words, borderColor: mainData.ColorScheme.words, noticeAlignment: "left", isBold: true)
                }
            }
            Spacer()
            Divider()
        }
    }
}

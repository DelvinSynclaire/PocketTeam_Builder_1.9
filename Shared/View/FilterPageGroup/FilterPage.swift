//
//  FilterPage.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 8/6/22.
//

import Foundation
import SwiftUI



struct FilterPage: View {
    @EnvironmentObject var mainData: MainData
    @StateObject var filterData = FilterDataClass()
 
    var body: some View{
        ZStack{
            
            VStack{
                HeaderForFilterPage(filterData: filterData)
                    .frame(width: mainData.pageData.pageWidth)
                    .background(
                        ZStack{
                            if mainData.appearanceData.activeAppearances.contains("Dark Mode") {
                                mainData.ColorScheme.neutralTwo
                                    .ignoresSafeArea()
                            } else {
                                mainData.ColorScheme.words
                                    .ignoresSafeArea()
                            }
                        }
                    )
                Spacer()
                VStack{
                    AppearanceFilter(filterData: filterData)
                    SpecialEvolutionFilter(filterData: filterData)
                    TypeFilter(filterData: filterData)
                    GenFilter(filterData: filterData)
                    StatFilter(filterData: filterData)
                }
                .frame(width: mainData.pageData.pageWidth / 1.1)
                Spacer()
                // Apply Filter
                RoundedRectangle(cornerRadius: 10)
                    .fill(mainData.ColorScheme.words)
                    .frame(width: mainData.pageData.pageWidth / 1.2, height: mainData.pageData.pageHeight / 18)
                    .overlay(
                        mainData.TextSetup(stringContent: "Apply Filters", typeFont: .headline, isBold: true, numOffset: 0, numOffsetY: 0, numColor: mainData.ColorScheme.neutralOne)
                    )
                    .onTapGesture {
                        mainData.filterPokemon()
                    }
                
            }
            filterSheetCard(filterData: filterData)
        }
        .transition(.move(edge: .trailing))
        .background(
            mainData.ColorScheme.neutralOne
                .ignoresSafeArea()
        )
        .onAppear{
            filterData.sheetBindingVariables.myOffset.height = 300
            print("Filter page OPENED -> onAppear: Chosen types are -> \(mainData.pokemonTypeData.chosenTypes) and \(mainData.pokemonTypeData.chosenTypes) : More Info -> struct Filter Page -> line 46")
            filterData.filterSet = [
                FilterDataSet(id: 1, title: "TYPES", Data: mainData.pokemonTypeData.allTypes, Func: mainData.resetTypeFilter()),
                FilterDataSet(id: 1, title: "GENERATIONS", Data: mainData.pokemonGenData.allGensTwo, Func: mainData.resetGenFilter()),
                FilterDataSet(id: 1, title: "STAT", Data: mainData.pokemonStatData.allStats, Func: mainData.resetStatFilter())

            ]
        }
    }
}


extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}


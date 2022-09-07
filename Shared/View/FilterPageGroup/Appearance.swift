//
//  Appearance.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 9/4/22.
//

import Foundation
import SwiftUI

// Appearance Filter for : Grid , List, Dark, Light
struct AppearanceFilter: View {
    @EnvironmentObject var mainData: MainData
    @ObservedObject var filterData : FilterDataClass
    let stringContentArray = ["Grid","List","Light Mode","Dark Mode"]

    let what: CGFloat = 12
    var body: some View {
        VStack{
                // APPEARANCE Header in Filer page : More Info -> MainData Folder -> View Functions
            mainData.HeaderTextView( stringContent: "Appearance", textAlignment: "\(filterData.filterBasics.textAlignment)",isBold: filterData.filterBasics.isBold,numPadding: filterData.filterBasics.numPadding,numColor: filterData.filterBasics.numColor, typeFont: .title2)
            HStack{
                ForEach(stringContentArray, id: \.self){ item in
                    let index = stringContentArray.firstIndex(of: item)

                    ZStack{
                        if index == 0{
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(mainData.ColorScheme.words)
                                .offset(x: 2)
                                .frame(width: mainData.pageData.pageWidth / 4.8, height: mainData.pageData.pageHeight / 25)
                                .mask(
                                    RoundedRectangle(cornerRadius: 5)
                                        .offset(x: mainData.appearanceData.gridOffset)
                                )
                               
                        } else if index == 1{
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(mainData.ColorScheme.words)
                                .offset(x: 2)
                                .frame(width: mainData.pageData.pageWidth / 4.8, height: mainData.pageData.pageHeight / 25)
                                .mask(
                                    RoundedRectangle(cornerRadius: 5)
                                        .offset(x: mainData.appearanceData.listOffset)
                                )
                        } else if index == 2{
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(mainData.ColorScheme.words)
                                .offset(x: 2)
                                .frame(width: mainData.pageData.pageWidth / 4.8, height: mainData.pageData.pageHeight / 25)
                                .mask(
                                    RoundedRectangle(cornerRadius: 5)
                                        .offset(x: mainData.appearanceData.lightOffset)
                                )
                        } else if index == 3{
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(mainData.ColorScheme.words)
                                .offset(x: 2)
                                .frame(width: mainData.pageData.pageWidth / 4.8, height: mainData.pageData.pageHeight / 25)
                                .mask(
                                    RoundedRectangle(cornerRadius: 5)
                                        .offset(x: mainData.appearanceData.darkOffset)
                                )
                        }
                        Button{
                            if item == "Grid"{
                                mainData.activateGrid(item: item)
                            } else if item == "List"{
                                mainData.activateList(item: item)
                            } else if item == "Light Mode"{
                                mainData.activateLight(item: item)
                                filterData.activateLight(item: item)
                            } else if item == "Dark Mode"{
                                mainData.activateDark(item: item)
                                filterData.activateDark(item: item)
                            }
                            print("\(item) button pressed! : More Info -> FilterPage File -> struct AppearanceFilter \n")
                        }label: {
                            mainData.FilterNotice(isActive: true, isBackground: 1, stringContent: "\(item)", noticeWidth: mainData.pageData.pageWidth / 4.925, noticeFont: .subheadline,textColor: mainData.appearanceData.activeAppearances.contains(item) ? mainData.ColorScheme.neutralOne : mainData.ColorScheme.words, borderColor: mainData.ColorScheme.words, noticeAlignment: "left", isBold: false)
                        }
                    }
                    
                }
                Spacer()
            }
            
            Spacer()
            Divider()
        }
    }
}
// Appearance Filter for : Mega Evolution, Gigantimax Evolution
struct SpecialEvolutionFilter: View {
    @EnvironmentObject var mainData: MainData
    @ObservedObject var filterData : FilterDataClass
    let stringContentArray = ["Mega Evolution", "Gigantimax Evolution"]

    let what: CGFloat = 12
    var body: some View {
        VStack{
                // APPEARANCE Header in Filer page : More Info -> MainData Folder -> View Functions
                mainData.HeaderTextView( stringContent: "Special Evolution Filter", textAlignment: "\(filterData.filterBasics.textAlignment)",isBold: filterData.filterBasics.isBold,numPadding: filterData.filterBasics.numPadding,numColor: filterData.filterBasics.numColor, typeFont: .title2)
            HStack{
                ForEach(stringContentArray, id: \.self){ item in
                    let index = stringContentArray.firstIndex(of: item)
                    ZStack{
                            if index == 0{
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundColor(mainData.ColorScheme.words)
                                    .offset(x: 3)
                                    .frame(width: mainData.pageData.pageWidth / 2.48, height: mainData.pageData.pageHeight / 25)
                                    .mask(
                                        RoundedRectangle(cornerRadius: 5)
                                            .offset(x: mainData.specialEvolutionData.specialEvoOffsetMega)
                                    )
                            } else {
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundColor(mainData.ColorScheme.words)
                                    .offset(x: 3)
                                    .frame(width: mainData.pageData.pageWidth / 2.48, height: mainData.pageData.pageHeight / 25)
                                    .mask(
                                        RoundedRectangle(cornerRadius: 5)
                                            .offset(x: mainData.specialEvolutionData.specialEvoOffsetGiga)
                                    )
                            }
                       
                            
                        
                        Button{
                            if item == "Mega Evolution"{
                                mainData.activateMega(item: item)
                            } else if item == "Gigantimax Evolution"{
                                mainData.activateGiga(item: item)
                            }
                            print("\(item) button pressed! : More Info -> FilterPage File -> struct SpecialEvolutionFilter \n")
                        }label: {
                            mainData.FilterNotice(isActive: true, isBackground: 1, stringContent: "\(item)", noticeWidth: mainData.pageData.pageWidth / 2.5, noticeFont: .subheadline,textColor: mainData.specialEvolutionData.chosenEvolution[item]! ? mainData.ColorScheme.neutralOne : mainData.ColorScheme.words, borderColor: mainData.ColorScheme.words, noticeAlignment: "left", isBold: false)
                        }
                    }
                }
                Spacer()
            }
            
            Spacer()
            Divider()
        }
    }
}

//
//  SheetForFilters.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 9/4/22.
//

import Foundation
import SwiftUI

struct filterSheetCard: View {
    @EnvironmentObject var mainData: MainData
    @ObservedObject var filterData : FilterDataClass
    
    
    var body: some View{
        

        if filterData.sheetBindingVariables.isPresented == true{
            ZStack{
                Color.black
                    .opacity(0.6)
                    .ignoresSafeArea()
                    .opacity(filterData.sheetBindingVariables.myOffset.height < 0 ? 1 : 2 - Double(abs(filterData.sheetBindingVariables.myOffset.height / 120)))
                VStack{
                    if filterData.sheetBindingVariables.isSheetContent == 1 {
                        VStack{
                            Spacer()
                            RoundedRectangle(cornerRadius: 10)
                                .fill(mainData.ColorScheme.neutralOne)
                                .frame(width: 210, height: 3)
                            VStack{
                                SheetTopBar(filterData: filterData, filter: $filterData.filterSet[0]).frame(width: mainData.pageData.pageWidth / 1.1)

                                ForEach(filterData.filterSet[0].Data, id: \.self){ data in
                                    Button{
                                        mainData.addType(item: data)
                                    } label: {
                                        // Words and buttons
                                        filterData.FilterCheckBoxForTypes(currentInfo: "\(data)", givenImageString: "circle", givenContent: "\(data)", typeFont: .headline, imageSize: 25, numColor: mainData.appearanceData.activeAppearances.contains("Dark Mode") ? mainData.ColorScheme.neutralOne : mainData.ColorScheme.words, isBold: true, chosenTypes: mainData.pokemonTypeData.chosenTypes).frame(width: mainData.pageData.pageWidth / 1.1)

                                    }
                                    
                                }
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .ignoresSafeArea()
                                    .foregroundColor(mainData.ColorScheme.backgroundOne)
                                    .frame(width: mainData.pageData.pageWidth)
                                
                            )
                        
                        }
                        .offset(x: 0, y: filterData.sheetBindingVariables.myOffset.height)
                       
                    }
                    if filterData.sheetBindingVariables.isSheetContent == 2 {
                        VStack{
                            Spacer()
                            RoundedRectangle(cornerRadius: 10)
                                .fill(mainData.ColorScheme.neutralOne)
                                .frame(width: 210, height: 3)
                            VStack{
                                SheetTopBar(filterData: filterData, filter: $filterData.filterSet[1]).frame(width: mainData.pageData.pageWidth / 1.1)

                                ForEach(filterData.filterSet[1].Data, id: \.self){ data in
                                    if data != "none"{
                                        Button{
                                            mainData.addGen(item: data)
                                        } label: {
                                            // Words and buttons
                                            filterData.FilterCheckBoxForGens(currentInfo: "\(data)", givenImageString: "circle", givenContent: "\(mainData.pokemonGenData.allGens[data]!)", typeFont: .headline, imageSize: 25, numColor: mainData.appearanceData.activeAppearances.contains("Dark Mode") ? mainData.ColorScheme.neutralOne : mainData.ColorScheme.words, isBold: true, chosenGen: mainData.pokemonGenData.chosenGen).frame(width: mainData.pageData.pageWidth / 1.1)

                                        }
                                    }
                                }
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .ignoresSafeArea()
                                    .foregroundColor(mainData.ColorScheme.backgroundOne)
                                    .frame(width: mainData.pageData.pageWidth)
                                
                            )
                        }
                        .offset(x: 0, y: filterData.sheetBindingVariables.myOffset.height)
                    }
                    if filterData.sheetBindingVariables.isSheetContent == 3 {
                        VStack{
                            Spacer()
                            RoundedRectangle(cornerRadius: 10)
                                .fill(mainData.ColorScheme.neutralOne)
                                .frame(width: 210, height: 3)
                            VStack{
                                SheetTopBar(filterData: filterData, filter: $filterData.filterSet[2]).frame(width: mainData.pageData.pageWidth / 1.1)

                                ForEach(filterData.filterSet[2].Data, id: \.self){ data in
                                    if data != "none"{
                                        Button{
                                            mainData.addStat(item: data)
                                        } label: {
                                            // Words and buttons
                                            filterData.FilterCheckBoxForStats(currentInfo: "\(data)", givenImageString: "circle", givenContent: "\(data)", typeFont: .headline, imageSize: 25, numColor: mainData.appearanceData.activeAppearances.contains("Dark Mode") ? mainData.ColorScheme.neutralOne : mainData.ColorScheme.words, isBold: true, chosenStat: mainData.pokemonStatData.chosenStat).frame(width: mainData.pageData.pageWidth / 1.1)

                                        }
                                    }
                                }
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .ignoresSafeArea()
                                    .foregroundColor(mainData.ColorScheme.backgroundOne)
                                    .frame(width: mainData.pageData.pageWidth)
                                
                            )
                        }
                        .offset(x: 0, y: filterData.sheetBindingVariables.myOffset.height)
                    }
                }
            }
            .frame(width: mainData.pageData.pageWidth, height: mainData.pageData.pageHeight)
            .opacity(filterData.sheetBindingVariables.myOffset.height < 0 ? 1 : 2 - Double(abs(filterData.sheetBindingVariables.myOffset.height / 120)))
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        filterData.sheetBindingVariables.myOffset = gesture.translation
                    }
                    .onEnded { _ in
                        if abs(filterData.sheetBindingVariables.myOffset.height) > 150 {
                            // remove the card
                            filterData.sheetBindingVariables.isPresented = false
                            filterData.sheetBindingVariables.isSheetContent = 0
                            filterData.sheetBindingVariables.myOffset.height = 300
                        } else if abs(filterData.sheetBindingVariables.myOffset.height) < -50{
                            filterData.sheetBindingVariables.myOffset = .zero
                        }else {
                            filterData.sheetBindingVariables.myOffset = .zero
                        }
                    }
            )
        }
    }
}

struct SheetTopBar : View {
    @EnvironmentObject var mainData: MainData
    @ObservedObject var filterData : FilterDataClass

    // you can change these parameters of the title all right here
    @Binding var filter : FilterDataSet
    
    var body: some View{
        HStack{
            mainData.HeaderTextView(stringContent: "\(filter.title)", textAlignment: "left", isBold: true, numPadding: 10, numColor: mainData.appearanceData.activeAppearances.contains("Dark Mode") ? mainData.ColorScheme.neutralOne : mainData.ColorScheme.words, typeFont: .title3)
            Spacer()
            // all Generations RESET button
            Button{
                if filter.title == "TYPES" {
                    mainData.resetTypeFilter()
                    print("reset button for type filters pressed : chosen gens restored : More info -> FilterPage")
                }
                if filter.title == "GENERATIONS" {
                    mainData.resetGenFilter()
                    print("reset button for gen filters pressed : chosen gens restored : More info -> FilterPage")
                }
                if filter.title == "STAT" {
                    mainData.resetStatFilter()
                    print("reset button for stat filters pressed : chosen gens restored : More info -> FilterPage")
                }
                filterData.sheetBindingVariables.isSheetContent = 0
                filterData.sheetBindingVariables.isPresented = false
                filterData.sheetBindingVariables.myOffset = .zero
                
            }label: {
                filterData.TextButtonSetup(numColor: mainData.ColorScheme.words, stringContent: "Reset", textWidth:100, textHeight: 100, typeFont: .subheadline)
            }
            
        }
    }
}

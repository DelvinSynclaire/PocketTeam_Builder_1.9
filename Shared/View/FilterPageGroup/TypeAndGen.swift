//
//  TypeAndGen.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 9/4/22.
//

import Foundation
import SwiftUI


// filter by type
struct TypeFilter: View {
    @EnvironmentObject var mainData: MainData
    @ObservedObject var filterData : FilterDataClass

    var body: some View {
        VStack{
            HStack{
                mainData.HeaderTextView( stringContent: "Type Filter", textAlignment: "\(filterData.filterBasics.textAlignment)",isBold: filterData.filterBasics.isBold,numPadding: filterData.filterBasics.numPadding,numColor: filterData.filterBasics.numColor, typeFont: .title2)
                Spacer()
                // VIEW ALL button in Filter page: More Info -> MainData Folder -> View Functions
                Button{
                    filterData.sheetBindingVariables.isPresented = true
                    filterData.sheetBindingVariables.isSheetContent = 1
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                        withAnimation(mainData.mySpring){
                            filterData.sheetBindingVariables.myOffset = .zero
                        }
                    }
                    print("View All for Type pressed! : More Info")
                }label: {
                    mainData.HeaderTextView(stringContent: "View All", textAlignment: "none", isBold: false, numPadding: 5, numColor: mainData.ColorScheme.words, typeFont: .headline)
                    mainData.SystemImageSetup(numColor: mainData.ColorScheme.words, systemImage: "chevron.right", imageWidth: mainData.pageData.pageWidth / 30, imageHeight: mainData.pageData.pageWidth / 30)
                }

            }
            ScrollView(.horizontal){
                HStack{
                    ForEach(mainData.pokemonTypeData.chosenTypes, id: \.self){ type in
                            if mainData.pokemonTypeData.chosenTypes.count > 1{
                                if type != "none" {
                                    mainData.FilterNotice(isActive: true, isBackground: 1, stringContent: "\(type.capitalizingFirstLetter())", noticeWidth: mainData.pageData.pageWidth / 4.5, noticeFont: .subheadline, textColor: mainData.ColorScheme.words, borderColor: mainData.ColorScheme.words, noticeAlignment: "left", isBold: true)
                                }
                            } else{
                                mainData.FilterNotice(isActive: true, isBackground: 1, stringContent: "\(type.capitalizingFirstLetter())", noticeWidth: mainData.pageData.pageWidth / 4.5, noticeFont: .subheadline,    textColor: mainData.ColorScheme.words, borderColor: mainData.ColorScheme.words, noticeAlignment: "left", isBold: true)
                            }
                        }
                    }
                }
            Spacer()
            Divider()
        }
    }
}
// filter by generation
struct GenFilter: View {
    @EnvironmentObject var mainData: MainData
    @ObservedObject var filterData : FilterDataClass

    var body: some View {
        VStack(alignment: .leading){
            HStack{
                mainData.HeaderTextView( stringContent: "Generation", textAlignment: "\(filterData.filterBasics.textAlignment)",isBold: filterData.filterBasics.isBold,numPadding: filterData.filterBasics.numPadding,numColor: filterData.filterBasics.numColor, typeFont: .title2)
                Spacer()
                // VIEW ALL button in Filter page: More Info -> MainData Folder -> View Functions
                Button{
                    filterData.sheetBindingVariables.isPresented = true
                    filterData.sheetBindingVariables.isSheetContent = 2
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                        withAnimation(mainData.mySpring){
                            filterData.sheetBindingVariables.myOffset = .zero
                        }
                    }
                    print("View All for Gen pressed! : More Info")
                }label: {
                    mainData.HeaderTextView(stringContent: "View All", textAlignment: "none", isBold: false, numPadding: 5, numColor: mainData.ColorScheme.words, typeFont: .headline)
                    mainData.SystemImageSetup(numColor: mainData.ColorScheme.words, systemImage: "chevron.right", imageWidth: mainData.pageData.pageWidth / 30, imageHeight: mainData.pageData.pageWidth / 30)
                }
            }
            ScrollView(.horizontal){
                HStack{
                    ForEach(mainData.pokemonGenData.chosenGen, id: \.self){ gen in
                            if mainData.pokemonGenData.chosenGen.count > 1{
                                if gen != "none" {
                                    mainData.FilterNotice(isActive: true, isBackground: 1, stringContent: "\(mainData.pokemonGenData.allGens[gen]!.capitalizingFirstLetter())", noticeWidth: mainData.pageData.pageWidth    / 4.5, noticeFont: .subheadline, textColor: mainData.ColorScheme.words, borderColor: mainData.ColorScheme.words, noticeAlignment: "left", isBold: true)
                                }
                               
                            } else {
                                mainData.FilterNotice(isActive: true, isBackground: 1, stringContent: "\(mainData.pokemonGenData.allGens[gen]!.capitalizingFirstLetter())", noticeWidth: mainData.pageData.pageWidth    / 4.5, noticeFont: .subheadline, textColor: mainData.ColorScheme.words, borderColor: mainData.ColorScheme.words, noticeAlignment: "left", isBold: true)
                            }

                        
                        }
                    }
                }
            Spacer()
            Divider()
        }
       
    }
    
}


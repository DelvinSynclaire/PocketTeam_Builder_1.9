//
//  HeaderView.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 9/2/22.
//

import Foundation
import SwiftUI

struct HeaderForSearchPage: View {
    @EnvironmentObject var mainData: MainData
    @FocusState private var isTypingFocus : Bool
    
    var body: some View{
        let animationSetup = AnimationSetupForImage(x: 0, y: 0, animaiton: mainData.mySpring, delay: DispatchTime.now())
            VStack(alignment: .leading){
                HStack{
                    // Back Button
                    Button{
                        mainData.pageData.pageNumber = 4
                        print("Back Button on Search Page was PRESSED!!")
                    }label: {
                        BackButton()
                            .offset(x: -5)
                    }
                    // Search Bar
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                            .fill(mainData.ColorScheme.neutralTwo)
                            .frame(height: mainData.pageData.pageHeight / 25)
                        SearchBar(isTypingFocus: _isTypingFocus)
                    }
                    .frame(width: mainData.pageData.pageWidth / 1.6)
                    Spacer()
                    // Filter button
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(mainData.appearanceData.activeAppearances.contains("Dark Mode") ? mainData.ColorScheme.tiles: mainData.ColorScheme.words)
                            .frame(width: mainData.pageData.pageWidth / 8, height: mainData.pageData.pageHeight / 25)
                        Rectangle()
                            .foregroundColor(mainData.ColorScheme.neutralOne)
                            .mask(
                                mainData.ImageSetup(isProgramImage: false, stringImage: "options", stringURLImage: "options", imageWidth: mainData.pageData.pageWidth / 20, imageHeight: mainData.pageData.pageHeight / 30,AnimationSetup: animationSetup)
                            )
                       
                    }
                    .onTapGesture {
                        withAnimation(mainData.mySpring){
                            mainData.pageData.pageNumber = 2
                        }
                    }
                }
            }
    }
}

struct BackButton: View {
    @EnvironmentObject var mainData: MainData
    
    var body: some View{
        let _ = AnimationSetupForImage(x: 0, y: 0, animaiton: mainData.mySpring, delay: DispatchTime.now())
        
        ZStack{
            mainData.SystemImageSetup(numColor: mainData.ColorScheme.neutralOne, systemImage: "arrow.left", imageWidth: 20, imageHeight: 20).padding().background(
                ZStack{
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(mainData.appearanceData.activeAppearances.contains("Dark Mode") ? mainData.ColorScheme.tiles: mainData.ColorScheme.words)
                        .frame(width: mainData.pageData.pageWidth / 12, height: mainData.pageData.pageHeight / 25)
                }
            )
        }
    }
}

struct SearchBar : View {
    @EnvironmentObject var mainData: MainData
    @FocusState var isTypingFocus : Bool

    var body: some View{
        HStack{
                Button{
                    isTypingFocus = false
                    // need to make it so that it can look up multiple different types of strings
                    mainData.activateSearchButton()
                }label: {
                    mainData.SystemImageSetup(numColor: mainData.ColorScheme.words, systemImage: "magnifyingglass", imageWidth: mainData.pageData.pageWidth / 25, imageHeight: mainData.pageData.pageHeight / 35).offset(x: 5)
                }
            ZStack {
                if mainData.searchPokemon.isEmpty{
                    mainData.TextSetup(stringContent: "Search Pokemon by name", typeFont: .subheadline, isBold: false, numOffset: isTypingFocus ? 5 : -15, numOffsetY: 0, numColor: mainData.ColorScheme.words)
                }
                TextField("", text: $mainData.searchPokemon)
                    .focused($isTypingFocus)
            }
              
               
            Spacer()
            if isTypingFocus ==  true {
                Button{
                    isTypingFocus = false
                    mainData.searchPokemon = ""
                }label: {
                    ZStack {
                        mainData.SystemImageSetup(numColor: mainData.ColorScheme.words, systemImage: "x.circle.fill", imageWidth: 15, imageHeight: 15).offsetAxisAnimation(x: 20, y: 0, mySpring: mainData.mySpring, delay: DispatchTime.now() ).mask(
                            Rectangle()
                                .frame(width: 20, height: 20)
                        )

                        Rectangle()
                            .fill(Color.clear)
                            .frame(width: 40, height: 40)
                    }
                }
            }
        }

    }
}


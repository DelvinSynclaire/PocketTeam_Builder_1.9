//
//  MainStatPage.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 8/28/22.
//

import Foundation
import SwiftUI

struct StatPage: View {
    @EnvironmentObject var mainData: MainData
    @State private var EvolutionChainForChosenPokemon = [String]()
    @State private var teamIsFull = false

    var body: some View{
        ZStack{
            VStack{
                VStack{
                    TopBar()
                        .testingBackground(isTesting: mainData.TESTING_HighlightBackGround, chosenColor: 1)
                        .frame(height: mainData.pageData.pageHeight / 4)
                    Spacer()
                    StatContentCarousel()
                        .testingBackground(isTesting: mainData.TESTING_HighlightBackGround, chosenColor: 3)
                        .frame(height: mainData.pageData.pageHeight / 2.5)

                    Spacer()
                }
                .testingBackground(isTesting: mainData.TESTING_HighlightBackGround, chosenColor: 4)
                AddToTeamButton(teamIsFull: $teamIsFull)
            }
            if teamIsFull == true {
                RemoveATeammate(teamIsFull: $teamIsFull)
                    .frame(width: mainData.pageData.pageWidth, height: mainData.pageData.pageHeight)

            }
        }
        .testingBackground(isTesting: mainData.TESTING_HighlightBackGround, chosenColor: 0)
        .background(
            mainData.ColorScheme.neutralOne
                .ignoresSafeArea()
                .frame(width: mainData.pageData.pageWidth, height: mainData.pageData.pageHeight)
        )
        .frame(width: mainData.pageData.pageWidth / 1.1, height: mainData.pageData.pageHeight)
        .onAppear{
            // LOADING Evolution data
            mainData.loadEvolutionResourceData(evoURL: "\(mainData.CurrentPokemonForStatPage!.species.url)")
            
            // LOADING Ability data
            for ability in mainData.CurrentPokemonForStatPage!.abilities{
                mainData.loadEvolutionAbilityData(abiURL: ability.ability.url)
            }
            // LOADING Type data
            mainData.loadTypeData(poke: mainData.CurrentPokemonForStatPage!)

        
            
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                if let test = mainData.CurrentPokemonEvolutionChain{
                    EvolutionChainForChosenPokemon = mainData.callEvolutions(evoChain: test)
                    timer.invalidate()
                }
            }
        }
        .onDisappear{
            mainData.draggingItem = 1
            mainData.CurrentPokemonAbilityResource.removeAll()
        }
        
    }
}

struct AddToTeamButton : View {
    @EnvironmentObject var mainData: MainData
    @Binding var teamIsFull : Bool

    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(mainData.ColorScheme.tiles)
                .frame(width: mainData.pageData.pageWidth / 1.5, height: 50)
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 2)
                .fill(mainData.ColorScheme.backgroundOne)
                .frame(width: mainData.pageData.pageWidth / 1.5, height: 50)
            if mainData.checkPoketeam(pokeTeam: mainData.PokeTeam, poke: mainData.CurrentPokemonForStatPage){
                mainData.TextSetup(stringContent: "Remove From Team", typeFont: .title3, isBold: true, numOffset: 0, numOffsetY: 0, numColor: mainData.ColorScheme.words)
            } else {
                mainData.TextSetup(stringContent: "Add To Team", typeFont: .title3, isBold: true, numOffset: 0, numOffsetY: 0, numColor: mainData.ColorScheme.words)
            }
       
        }
        .onTapGesture {
            if mainData.PokeTeam.count <= 5 {
                if mainData.checkPoketeam(pokeTeam: mainData.PokeTeam, poke: mainData.CurrentPokemonForStatPage){
                    /// remove from the pokemon team
                    mainData.addToPokeTeam(poke: mainData.CurrentPokemonForStatPage, isAdd: false)
                    mainData.pageData.pageNumber = 1

                } else {
                    /// add to pokemon team
                    mainData.addToPokeTeam(poke: mainData.CurrentPokemonForStatPage, isAdd: true)
                    mainData.pageData.pageNumber = 1
                }
            } else {
                teamIsFull = true
            }
        }
    }
}

struct RemoveATeammate: View {
    @EnvironmentObject var mainData: MainData
    @Binding var teamIsFull : Bool
    @State var myOpacity = 0.0
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.black)
                .ignoresSafeArea()
                .opacity(myOpacity)
                .onAppear{
                    withAnimation(mainData.mySpring){
                        myOpacity = 0.8
                    }
                }
            ZStack{
                // Blue Background
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(mainData.ColorScheme.backgroundOne)
                    .frame(width: mainData.pageData.pageWidth / 1.5, height: mainData.pageData.pageHeight / 1.3)

                VStack(alignment: .leading){
                    // Title Disclaimer
                    mainData.TextSetup(stringContent: "PokeTeam is full", typeFont: .title3, isBold: true, numOffset: 0, numOffsetY: 0, numColor: mainData.ColorScheme.words)
                    mainData.TextSetup(stringContent: "Please remove one of your pokemon", typeFont: .subheadline, isBold: true, numOffset: 0, numOffsetY: 0, numColor: mainData.ColorScheme.words)
                    Spacer()
                    
                    // List of Pokemon
                    ForEach(mainData.PokeTeam, id: \.!.id){ teammate in
                        let animationSetup = AnimationSetupForImage(x: -100, y: 0, animaiton: mainData.mySpring, delay: DispatchTime.now() + 0.5)
                        mainData.RemovePokemonBarView(teammate: teammate, teamIsFull: $teamIsFull, animationSetup: animationSetup)
                    }
                }
                .frame(width: mainData.pageData.pageWidth / 1.7, height: mainData.pageData.pageHeight / 1.5)
            }
            .offsetAxisAnimation(x: 0, y: -200, mySpring: mainData.mySpring, delay: DispatchTime.now() + 0.1)
            
        }
    }
}



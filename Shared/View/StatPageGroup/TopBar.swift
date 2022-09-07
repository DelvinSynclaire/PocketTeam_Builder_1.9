//
//  TopBar.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 8/28/22.
//

import Foundation
import SwiftUI

struct TopBar: View{
    @EnvironmentObject var mainData: MainData
    var body: some View{
        VStack{
            BackButtonAndTitle()
                .padding()
            PokemonImageAndDescription()
                .testingBackground(isTesting: mainData.TESTING_HighlightBackGround, chosenColor: 2)
        }
    }
}

struct BackButtonAndTitle: View {
    @EnvironmentObject var mainData: MainData

    var body: some View{

        VStack{
            HStack{
                Button{
                    mainData.pageData.pageNumber = 1
                    print("stat page for \(mainData.CurrentPokemonForStatPage?.name ?? "No Pokemon Chosen") has closed")
                } label: {
                    ZStack{
                        mainData.SystemImageSetup(numColor: mainData.ColorScheme.words, systemImage: "chevron.left", imageWidth: mainData.pageData.pageWidth / 20, imageHeight: mainData.pageData.pageWidth / 20)
                    }
                    .offset(x: 10)
                }
             
                Spacer()
                mainData.TextSetup(stringContent: "Stats For \(mainData.CurrentPokemonForStatPage?.name ?? "No Pokemon Chosen" )", typeFont: .headline, isBold: false, numOffset: 0, numOffsetY: 0, numColor: mainData.ColorScheme.words)
                Spacer()
            }
            .frame(width: mainData.pageData.pageWidth / 1.15)
        }
    }
}

struct PokemonImageAndDescription : View{
    @EnvironmentObject var mainData: MainData

    var body: some View{
        let animationSetup = AnimationSetupForImage(x: 0, y: 150, animaiton: mainData.mySpring, delay: DispatchTime.now() + 0.5)
        HStack{
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(mainData.ColorScheme.tiles)
                        .frame(width: 100)
                    
                    // Pokemon image for Top Bar
                    ZStack{
                        mainData.ImageSetup(isProgramImage: true,stringImage: "\(mainData.CurrentPokemonForStatPage!.name)", stringURLImage: "\(mainData.CurrentPokemonForStatPage!.name)", imageWidth: 150, imageHeight: 150, AnimationSetup: animationSetup)
                    }
                    .frame(width: 100)
                    .mask(
                        Rectangle()
                            .frame(width: 100)
                    )
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .fill(mainData.ColorScheme.words)
                        .frame(width: 100)
                }
                .frame(width: 175)
                
                // Text List of Pokemon name, species and generation
                VStack(alignment: .leading){
                    /// Pokemon Name
                    mainData.TextSetup(stringContent: "\(mainData.CurrentPokemonForStatPage!.name.capitalizingFirstLetter())", typeFont: .title, isBold: true, numOffset: 0, numOffsetY: 0, numColor: mainData.ColorScheme.words)
                    /// The (the pokemon Species) Pokemon
                    mainData.TextSetup(stringContent: "The \(mainData.callGenus(species: mainData.CurrentPokemonSpeciesResource))", typeFont: .title3, isBold: false, numOffset: 0, numOffsetY: 0, numColor: mainData.ColorScheme.words)
                    /// From Generation : (the pokemon game)
                    mainData.TextSetup(stringContent: "From Genreation : \(mainData.callGeneration(poke: mainData.CurrentPokemonForStatPage!).capitalizingFirstLetter())", typeFont: .subheadline, isBold: false, numOffset: 0, numOffsetY: 5, numColor: mainData.ColorScheme.words)
                    TypeDisplayView()
                }
                .testingBackground(isTesting: mainData.TESTING_HighlightBackGround, chosenColor: 1)
                .offsetAxisAnimation(x: -300, y: 0, mySpring: mainData.mySpring, delay: DispatchTime.now() + 0.7)
                .mask(
                    Rectangle()
                        .offset(x: 50)
                        .frame(width: mainData.pageData.pageWidth / 1.25, height: 200)
                )
            }
            Spacer()
        }
        .frame(width: mainData.pageData.pageWidth)
    }
}

struct TypeDisplayView : View {
    @EnvironmentObject var mainData: MainData
    @State private var isShape: CGFloat = 27
    @State private var isOpaque: Double = 0

    var body: some View{
        let animationSetup = AnimationSetupForImage(x: 0, y: 0, animaiton: mainData.mySpring, delay: DispatchTime.now() + 0.5)
        HStack{
            ForEach(mainData.CurrentPokemonForStatPage!.types, id: \.self){ pokeType in
                let index = mainData.pokemonTypeData.allTypes.firstIndex(of: pokeType.type.name)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(mainData.pokemonTypeData.typeColors[index!])
                        .offset(x: isShape)
                        .frame(width: 90, height: 35)
                    mainData.ImageSetup(isProgramImage: false, stringImage: "\(pokeType.type.name)", stringURLImage: "\(pokeType.type.name)", imageWidth: 25, imageHeight: 25, AnimationSetup: animationSetup)
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                            withAnimation(mainData.mySpring){
                                isShape = -30
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.25){
                            withAnimation(mainData.mySpring){
                                isOpaque = 1
                            }
                        }
                    }
                    mainData.TextSetup(stringContent: "\(pokeType.type.name.capitalizingFirstLetter())", typeFont: .subheadline, isBold: true, numOffset: 0, numOffsetY: 0, numColor: mainData.ColorScheme.words).offset(x: -40).opacity(isOpaque)
                }
                .mask(
                    RoundedRectangle(cornerRadius: 25)
                        .offset(x: -27)
                        .frame(width: 90, height: 35)
                )
            }
        }
        .offset(x: 30)
    }
}

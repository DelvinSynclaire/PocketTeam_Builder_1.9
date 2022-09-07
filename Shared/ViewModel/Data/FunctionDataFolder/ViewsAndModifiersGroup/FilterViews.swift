//
//  ViewsAndViewModifiers.swift
//  PokeTeam_1.8
//
//  Created by Delvin Cockroft on 8/27/22.
//

import Foundation
import SwiftUI

extension MainData{
    // MARK: VIEW functions
    

    func FilterNotice(isActive: Bool, isBackground : Int, stringContent: String, noticeWidth: Double, noticeFont : Font, textColor: Color, borderColor: Color, noticeAlignment: String, isBold: Bool) -> some View{
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .stroke(borderColor, lineWidth: 2)
                .frame(width: noticeWidth, height: self.pageData.pageHeight / 25)
            HStack{
                if noticeAlignment == "right"{
                    Spacer()
                }
                Text("\(stringContent)")
                    .fontWeight(isBold ? .bold : .regular)
                    .font(noticeFont)
                    .foregroundColor(textColor)
                    .offset(x: isActive ? 5: self.pageData.pageWidth + 50)
                if noticeAlignment == "left"{
                    Spacer()
                }
            }
        }
        .offset(x: 2)
        .frame(width: noticeWidth, height: self.pageData.pageHeight / 25)
    }
    
    func TeamPageCard(teammate: String, poke: Pokemon, animationSetup: AnimationSetupForImage?) -> some View{
        VStack{
            // image, name and types
            HStack{
                self.ImageSetup(isProgramImage: true, stringImage: "\(teammate)", stringURLImage: "\(teammate)", imageWidth: self.pageData.pageWidth / 4, imageHeight: self.pageData.pageWidth / 4, AnimationSetup: animationSetup).background(
                    Circle()
                        .frame(width: self.pageData.pageWidth / 6, height: self.pageData.pageWidth / 6)
                )
                self.TextSetup(stringContent: "# \(poke.id)", typeFont: .title3, isBold: true, numOffset: 0, numOffsetY: 0, numColor: self.ColorScheme.words)
                Spacer()
                HStack{
                    self.ImageSetup(isProgramImage: false, stringImage: "\(poke.types[0].type.name)", stringURLImage: "\(poke.types[0].type.name)", imageWidth: 30, imageHeight: 30, AnimationSetup: animationSetup)
                    if poke.types.count > 1 {
                        self.ImageSetup(isProgramImage: false, stringImage: "\(poke.types[1].type.name)", stringURLImage: "\(poke.types[1].type.name)", imageWidth: 30, imageHeight: 30, AnimationSetup: animationSetup)
                    }
                }
                .offset(x: -50)
            }
            // pokemon name and species
            HStack{
                self.TextSetup(stringContent: "\(teammate.capitalizingFirstLetter())", typeFont: .title2, isBold: true, numOffset: 0, numOffsetY: 0, numColor: self.ColorScheme.words)
                self.TextSetup(stringContent: "The \(self.callGenus(species: self.CurrentPokemonSpeciesResource))", typeFont: .title3, isBold: false, numOffset: 0, numOffsetY: 0, numColor: self.ColorScheme.words)
                Spacer()
            }
            .padding(.bottom, 5)
            .offset(x: 10)
            // abilities and highest stat
            HStack{
                VStack(alignment: .leading){
                    self.TextSetup(stringContent: "Abilities :", typeFont: .headline, isBold: true, numOffset: 0, numOffsetY: 0, numColor: self.ColorScheme.words)
                    HStack{
                        self.TextSetup(stringContent: "\(poke.abilities[0].ability.name.capitalizingFirstLetter()) /", typeFont: .headline, isBold: true, numOffset: 0, numOffsetY: 0, numColor: self.ColorScheme.words).fixedSize()
                        if poke.abilities.count > 1{
                            self.TextSetup(stringContent: "\(poke.abilities[1].ability.name.capitalizingFirstLetter())", typeFont: .headline, isBold: true, numOffset: 0, numOffsetY: 0, numColor: self.ColorScheme.words).fixedSize()
                        }
                    }
                }
                Spacer()
                // highest stat
                VStack(alignment: .leading){
                    let statIndex = self.pokemonStatData.allStats.firstIndex(of: self.findLargestStat(poke: poke).name)
                    self.TextSetup(stringContent: "Highest Stat :", typeFont: .headline, isBold: true, numOffset: 0, numOffsetY: 0, numColor: self.ColorScheme.words).fixedSize()
                    HStack{
                        self.TextSetup(stringContent: "\(self.pokemonStatData.shortStats[statIndex!].capitalizingFirstLetter()) - ", typeFont: .subheadline, isBold: false, numOffset: 0, numOffsetY: 0, numColor: self.ColorScheme.words).fixedSize()
                        self.TextSetup(stringContent: "\(self.findLargestStat(poke: poke).amount)", typeFont: .subheadline, isBold: false, numOffset: 0, numOffsetY: 0, numColor: self.ColorScheme.words).fixedSize()
                    }
                }
                Spacer()
            }
            .offset(x: 10)
        }
    }

    func PokemonGridView(poke: Pokemon?, gridWidth: Double, gridHeight: Double, numColor: Color,animationSetup: AnimationSetupForImage?, myOffset: CGFloat) -> some View {
        ZStack{
            let myWidth = self.pageData.pageWidth / 3.8
            let defaultAnimation = AnimationSetupForImage(x: 0, y: 0, animaiton: self.mySpring, delay: DispatchTime.now())
            
            // Background Color
            RoundedRectangle(cornerRadius: 5)
                .fill(numColor)
                .frame(width: myWidth / 1.1, height: myWidth)
            
            VStack{
                // Here is the Image for each Pokemon tile
                self.ImageSetup(isProgramImage: true, stringImage: "\(poke!.name)", stringURLImage: "\(poke!.name)", imageWidth: myWidth / 1.1 , imageHeight: myWidth / 1.2, AnimationSetup: defaultAnimation).offset(x: -CGFloat(myOffset * CGFloat((poke!.id)))).mask(
                    Rectangle()
                        .frame(width: myWidth, height: myWidth)
                )
                self.TextSetup(stringContent: "\(poke!.name.capitalizingFirstLetter())", typeFont: .body, isBold: false, numOffset: 0, numOffsetY: -15, numColor: self.ColorScheme.words).background(
                        RoundedRectangle(cornerRadius: 5)
                            .offset(y: -15)
                            .fill(numColor)
                    )
            }
        }
        .frame(width: gridWidth, height: gridHeight)
    }
    func PokemonListView(poke: Pokemon?, gridWidth: Double, gridHeight: Double, numColor: Color,animationSetup: AnimationSetupForImage?, myOffset: CGFloat) -> some View {
        ZStack{
            let defaultAnimation = AnimationSetupForImage(x: 0, y: 0, animaiton: self.mySpring, delay: DispatchTime.now())
            
            // Background Color
            HStack{
                RoundedRectangle(cornerRadius: 5)
                    .fill(numColor)
                    .frame(width: self.pageData.pageWidth / 2 , height: gridHeight / 1.1)
                Spacer()
            }
            
            HStack{
                // Here is the Image for each Pokemon tile
                self.ImageSetup(isProgramImage: true, stringImage: "\(poke!.name)", stringURLImage: "\(poke!.name)", imageWidth: 80 , imageHeight: 80 , AnimationSetup: defaultAnimation).offset(x: -CGFloat(myOffset * CGFloat((poke!.id)))).mask(
                    Rectangle()
                        .frame(width: 50, height: 50)
                )
                self.TextSetup(stringContent: "\(poke!.name.capitalizingFirstLetter())", typeFont: .headline, isBold: true, numOffset: 0, numOffsetY: 0, numColor: self.ColorScheme.words)
                Spacer()
                self.ImageSetup(isProgramImage: false, stringImage: "\(poke!.types[0].type.name)", stringURLImage: "\(poke!.name)", imageWidth: 30, imageHeight: 30, AnimationSetup: defaultAnimation).offset(x: -CGFloat(myOffset * CGFloat((poke!.id)))).mask(
                    Rectangle()
                        .frame(width: 50, height: 50)
                )
                if (poke?.types.count)! > 1 {
                    self.ImageSetup(isProgramImage: false, stringImage: "\(poke!.types[1].type.name)", stringURLImage: "\(poke!.name)", imageWidth: 30 , imageHeight: 30, AnimationSetup: defaultAnimation).offset(x: -CGFloat(myOffset * CGFloat((poke!.id)))).mask(
                        Rectangle()
                            .frame(width: 50, height: 50)
                    )
                }
            }
        }
        .padding()
        .frame(width: gridWidth, height: gridHeight)
    }
    func GridOrList(poke: Pokemon?, myOffset: CGFloat) -> some View{
        ZStack{
            if self.columnData.isGrid == true {
                let animationSetup = AnimationSetupForImage(x: 0, y: 0, animaiton: self.mySpring, delay: DispatchTime.now() + 0.5)
                
                self.PokemonGridView(poke: poke, gridWidth: self.pageData.pageWidth / 4, gridHeight: self.pageData.pageWidth / 3.8, numColor: self.ColorScheme.tiles, animationSetup: animationSetup, myOffset: myOffset).onTapGesture{
                        // add pokemon to the stat page
                        self.addToStatPage(poke: poke)
                    }
            } else {
                let animationSetup = AnimationSetupForImage(x: 0, y: 0, animaiton: self.mySpring, delay: DispatchTime.now() + 0.5)

                self.PokemonListView(poke: poke, gridWidth: self.pageData.pageWidth / 1.2, gridHeight: self.pageData.pageHeight / 20, numColor: self.ColorScheme.tiles, animationSetup: animationSetup, myOffset: myOffset).onTapGesture{
                        // add pokemon to the stat page
                        self.addToStatPage(poke: poke)
                    }
                
            }

        }
    }
    
}


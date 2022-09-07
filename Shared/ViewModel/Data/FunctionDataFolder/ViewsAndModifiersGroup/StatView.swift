//
//  StatView.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 9/4/22.
//

import Foundation
import SwiftUI

extension MainData{
    
    func PokemonTypesByNameView(chain: String, animationSetup: AnimationSetupForImage?) -> some View{
        HStack{
            let pokemonByName = self.callPokemonByName(poke: chain)

            self.ImageSetup(isProgramImage: false,stringImage: "\(pokemonByName.types[0].type.name)", stringURLImage: "\(pokemonByName.types[0].type.name)", imageWidth: 25, imageHeight: 25, AnimationSetup: animationSetup)
            if pokemonByName.types.count > 1 {
                self.ImageSetup(isProgramImage: false,stringImage: "\(pokemonByName.types[1].type.name)", stringURLImage: "\(pokemonByName.types[1].type.name)", imageWidth: 25, imageHeight: 25, AnimationSetup: animationSetup)
            }
        }
    }
    func RemovePokemonBarView(teammate: Pokemon?,teamIsFull: Binding<Bool> ,animationSetup: AnimationSetupForImage?) -> some View {
        VStack{
            HStack{
                /// pokemon image
                self.ImageSetup(isProgramImage: true, stringImage: "\(teammate!.name)", stringURLImage: "\(teammate!.name)", imageWidth: 75, imageHeight: 75, AnimationSetup: animationSetup).mask(
                    Rectangle()
                        .frame(width: 100, height: 100)
                )
                Spacer()
                /// pokemon name
                self.TextSetup(stringContent: "\(teammate!.name)", typeFont: .headline, isBold: true, numOffset: 0, numOffsetY: 0, numColor: self.ColorScheme.words)
                Spacer()
                /// remove pokemon Button
                Button{
                    self.addToPokeTeam(poke: teammate, isAdd: false)
                    teamIsFull.wrappedValue.toggle()
                } label: {
                    self.SystemImageSetup(numColor: self.ColorScheme.words, systemImage: "xmark.circle.fill", imageWidth: 15, imageHeight: 15)
                }
            }
            Rectangle()
                .foregroundColor(self.ColorScheme.backgroundOne)
                .frame(width: self.pageData.pageWidth / 1.7, height: 2)
        }
    }
    
    func StatBar(name: String, stat: Int, AnimationSetup : AnimationSetupForImage?) -> some View{
        HStack{
            let percentage = self.pageData.pageWidth * 0.01
            
            HStack{
                TextSetup(stringContent: "\(name)", typeFont: .subheadline, isBold: true, numOffset: 0, numOffsetY: 0, numColor: self.ColorScheme.words)
                Spacer()
            }
            .frame(width: self.pageData.pageWidth / 8)
            HStack{
                TextSetup(stringContent: "\(stat)", typeFont: .subheadline, isBold: false, numOffset: 0, numOffsetY: 0, numColor: self.ColorScheme.words)
                Spacer()
            }
            .frame(width: self.pageData.pageWidth / 8)
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(self.ColorScheme.neutralTwo)
                    .frame(width: self.pageData.pageWidth / 2.1, height: 8)
                RoundedRectangle(cornerRadius: 10)
                    .fill(self.ColorScheme.backgroundOne)
                    .frame(width: self.pageData.pageWidth / 2.1, height: 8)
                    .mask(
                        HStack{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(self.ColorScheme.backgroundOne)
                                .frame(width: percentage * CGFloat(round(Double(stat) / 4.5)), height: 10)
                                .offsetAxisAnimation(x: AnimationSetup!.x, y: AnimationSetup!.y, mySpring: AnimationSetup!.animaiton, delay: AnimationSetup!.delay)
                            Spacer()
                        }
                    )
            }
            .scaleAnimation(scale: 0, mySpring: self.mySpring, delay: DispatchTime.now() + 0.25)
           
            Spacer()
        }
    }
    
    // Circle beind the pokemon
    func PokemonCircle(chain: String, animationSetup: AnimationSetupForImage?) -> some View{
        ZStack{
            Circle()
                .fill(self.ColorScheme.tiles)
                .frame(width: 125)
            Circle()
                .stroke(lineWidth: 2)
                .fill(self.ColorScheme.words)
                .frame(width: 125)
            ZStack{
                self.ImageSetup(isProgramImage: true, stringImage: "\(chain)", stringURLImage: "\(chain)", imageWidth: 150, imageHeight: 150, AnimationSetup: animationSetup)
            }
            .mask(
                Circle()
                    .frame(width: 125)
            )
          
        }
    }
    
    
    // "About" in Stat Page
    func AboutBar(name: String, stat: Any, AnimationSetup : AnimationSetupForImage?) -> some View{
        HStack{
            self.TextSetup(stringContent: "\(name)", typeFont: .subheadline, isBold: true, numOffset: 0, numOffsetY: 0, numColor: self.ColorScheme.words).offsetAxisAnimation(x: AnimationSetup!.x, y: AnimationSetup!.y, mySpring: AnimationSetup!.animaiton, delay: AnimationSetup!.delay).mask(
                    Rectangle()
            )
            Spacer()
            if let myStat = stat as? [Species]{
                self.TextSetup(stringContent: "\(myStat[0].name.capitalizingFirstLetter() )", typeFont: .subheadline, isBold: false, numOffset: 0, numOffsetY: 0, numColor: self.ColorScheme.words).padding(.trailing, 1).offsetAxisAnimation(x: AnimationSetup!.x, y: -AnimationSetup!.y, mySpring: AnimationSetup!.animaiton, delay: AnimationSetup!.delay + 0.3).mask(
                    Rectangle()
                )
                if myStat.count > 1 {
                    self.TextSetup(stringContent: "\(myStat[1].name.capitalizingFirstLetter() )", typeFont: .subheadline, isBold: false, numOffset: 0, numOffsetY: 0, numColor: self.ColorScheme.words).offsetAxisAnimation(x: AnimationSetup!.x, y: -AnimationSetup!.y, mySpring: AnimationSetup!.animaiton, delay: AnimationSetup!.delay + 0.3).mask(
                        Rectangle()
                    )
                }
              
            } else {
                self.TextSetup(stringContent: "\(stat)", typeFont: .subheadline, isBold: false, numOffset: 0, numOffsetY: 0, numColor: self.ColorScheme.words).offsetAxisAnimation(x: AnimationSetup!.x, y: -AnimationSetup!.y, mySpring: AnimationSetup!.animaiton, delay: AnimationSetup!.delay + 0.3).mask(
                    Rectangle()
                )
            }
        }
    }
    func SpeciesView(item : [Species]) -> some View{
        HStack{
            ForEach(item, id: \.self){ egg in
                self.TextSetup(stringContent: "\(egg.name.capitalizingFirstLetter())", typeFont: .subheadline, isBold: true, numOffset: 0, numOffsetY: 0, numColor: self.ColorScheme.words)
            }
        }
    }
    
    // "More Info" in Stat Page -> Abilities
    func AbilityNotice(resource: AbilityResource?) -> some View{
        VStack{
            ForEach(resource!.names, id: \.self){ name in
                if name.language.name == "en"{
                    self.HeaderTextView(stringContent: "\(name.name)", textAlignment: "left", isBold: true, numPadding: 10, numColor: self.ColorScheme.words, typeFont: .subheadline)
                }
            }
            Divider()
            ForEach(resource!.effect_entries, id: \.self){ effect in
                if effect.language.name == "en"{
                    self.TextSetup(stringContent: "\(effect.effect)", typeFont: .body, isBold: false, numOffset: 0, numOffsetY: 0, numColor: self.ColorScheme.words)
                }
            }
        }
    }
    func TypeEffectView(Effect: [Species], title: String, animationSetup: AnimationSetupForImage?) -> some View{
       
        HStack{
            
            self.TextSetup(stringContent: "\(title)", typeFont: .subheadline, isBold: true, numOffset: 0, numOffsetY: 0, numColor: self.ColorScheme.words)
            Spacer()
            ForEach(Effect, id: \.self){ effect in
                let index = Effect.firstIndex(of: effect)
                self.ImageSetup(isProgramImage: false, stringImage: "\(effect.name)", stringURLImage: "\(effect.name)", imageWidth: 25, imageHeight: 25, AnimationSetup: animationSetup).offsetAxisAnimation(x: animationSetup!.x * CGFloat((index! + 1) * 10), y: animationSetup!.y, mySpring: animationSetup!.animaiton, delay: animationSetup!.delay)
            }
        }
    }

}

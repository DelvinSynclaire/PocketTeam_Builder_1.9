//
//  BasicViews.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 9/4/22.
//

import Foundation
import SwiftUI

extension MainData{

    // MARK: - Basic TEXT Setup
    // Text setup for Header text
    func HeaderTextView(stringContent: String, textAlignment: String, isBold: Bool, numPadding: CGFloat, numColor: Color, typeFont: Font) -> some View{
        
        HStack{
            if textAlignment == "right" || textAlignment == "both"{
                Spacer()
            }
            Text("\(stringContent)")
                .fontWeight(isBold ? .bold : .regular)
                .padding(numPadding)
                .font(typeFont)
                .foregroundColor(numColor)
            if textAlignment == "left" || textAlignment == "both"{
                Spacer()
            }
        }
        
    }
    // Text setup for Button Text
    func TextButtonSetup(numColor: Color, stringContent: String, textWidth: Double, textHeight: Double, typeFont: Font, function: (), printInfo: String ) -> some View{
        Button{
            function
            print("\(printInfo)")
        }label: {
            Rectangle()
                .fill(Color.clear)
                .frame(width: textWidth, height: textHeight)
                .overlay(
                    Text("\(stringContent)")
                        .font(typeFont)
                        .padding()
                        .fixedSize()
                        .foregroundColor(numColor)
                )
        }
        
    }
    // Text setup for Basic Text
    func TextSetup(stringContent : String, typeFont: Font, isBold: Bool, numOffset: CGFloat,numOffsetY: CGFloat ,numColor: Color) -> some View{
        Text("\(stringContent)")
            .fontWeight(isBold ? .bold : .regular)
            .font(typeFont)
            .offset(x: numOffset, y: numOffsetY)
            .foregroundColor(numColor)
    }
    
    // MARK: - Basic IMAGE Setup
    // Image Setup for asset image or URL image
    func ImageSetup(isProgramImage: Bool, stringImage: String, stringURLImage: String, imageWidth: Double, imageHeight: Double, AnimationSetup : AnimationSetupForImage?)-> some View{

        ZStack{
            let animationSetup = AnimationSetup

            if isProgramImage == false {
                
                Image("\(stringImage)")
                    .resizable()
                    .scaledToFit()
                
            } else{
                AsyncImage(url: self.ImagePokemonDictionary[stringURLImage] ?? self.ImagePokemonDictionary["Bulbasaur"]){ image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    Color.clear
                }
                .offsetAxisAnimation(x: animationSetup!.x , y: animationSetup!.y , mySpring: animationSetup!.animaiton, delay: animationSetup!.delay)
                .mask{
                    RoundedRectangle(cornerRadius: 10)
                        .padding(1)
                }
            }
        }
        .frame(width: imageWidth, height: imageWidth)
        
    }
    // Image Setup for SF Symbols
    func SystemImageSetup(numColor: Color, systemImage: String, imageWidth: Double, imageHeight: Double) -> some View{
        Rectangle()
            .foregroundColor(numColor)
            .mask(
                Image(systemName: "\(systemImage)")
                    .resizable()
                    .scaledToFit()
            )
            .frame(width: imageWidth, height: imageWidth)
    }
    
}
extension FilterDataClass{

    // MARK: - Basic TEXT Setup
    // Text setup for Header text
    func HeaderTextView(stringContent: String, textAlignment: String, isBold: Bool, numPadding: CGFloat, numColor: Color, typeFont: Font) -> some View{
        
        HStack{
            if textAlignment == "right" || textAlignment == "both"{
                Spacer()
            }
            Text("\(stringContent)")
                .fontWeight(isBold ? .bold : .regular)
                .padding(numPadding)
                .font(typeFont)
                .foregroundColor(numColor)
            if textAlignment == "left" || textAlignment == "both"{
                Spacer()
            }
        }
        
    }
    // Text setup for Button Text
    func TextButtonSetup(numColor: Color, stringContent: String, textWidth: Double, textHeight: Double, typeFont: Font) -> some View{
        Rectangle()
            .fill(Color.clear)
            .frame(width: textWidth, height: textHeight)
            .overlay(
                Text("\(stringContent)")
                    .font(typeFont)
                    .padding()
                    .foregroundColor(numColor)
            )
    }
    // Text setup for Basic Text
    func TextSetup(stringContent : String, typeFont: Font, isBold: Bool, numOffset: CGFloat,numOffsetY: CGFloat ,numColor: Color) -> some View{
        Text("\(stringContent)")
            .fontWeight(isBold ? .bold : .regular)
            .font(typeFont)
            .offset(x: numOffset, y: numOffsetY)
            .foregroundColor(numColor)
    }

    // Image Setup for SF Symbols
    func SystemImageSetup(numColor: Color, systemImage: String, imageWidth: Double, imageHeight: Double) -> some View{
        Rectangle()
            .foregroundColor(numColor)
            .mask(
                Image(systemName: "\(systemImage)")
                    .resizable()
                    .scaledToFit()
            )
            .frame(width: imageWidth, height: imageWidth)
    }
    
}

    
 
  

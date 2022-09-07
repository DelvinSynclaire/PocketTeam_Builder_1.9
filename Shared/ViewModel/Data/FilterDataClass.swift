//
//  FilterData.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 9/4/22.
//

import Foundation
import SwiftUI

class FilterDataClass : ObservableObject {
    @Published var sheetBindingVariables = SheetBindingVariables(isPresented: false, myOffset: CGSize.zero,isSheetContent : 0)
    @Published var filterBasics = FilterBasics(isBold: true, numPadding: 0, numColor:  Color( #colorLiteral(red: 0.1442590058, green: 0.1522315443, blue: 0.2122519016, alpha: 1) ), textAlignment: "left")
    @Published var filterSet = [FilterDataSet]()
    @Published var ColorScheme = colorScheme(
        words: Color( #colorLiteral(red: 0.1442590058, green: 0.1522315443, blue: 0.2122519016, alpha: 1) ) , backgroundOne:  Color( #colorLiteral(red: 0.1442590058, green: 0.1522315443, blue: 0.2122519016, alpha: 1) )  , backgroundTwo:  Color( #colorLiteral(red: 0.1442590058, green: 0.1522315443, blue: 0.2122519016, alpha: 1) )  , tiles:  Color( #colorLiteral(red: 0.1442590058, green: 0.1522315443, blue: 0.2122519016, alpha: 1) )  , accentOne:  Color( #colorLiteral(red: 0.1442590058, green: 0.1522315443, blue: 0.2122519016, alpha: 1) )  , accentTwo:  Color( #colorLiteral(red: 0.1442590058, green: 0.1522315443, blue: 0.2122519016, alpha: 1) )  , neutralOne:  Color( #colorLiteral(red: 0.1442590058, green: 0.1522315443, blue: 0.2122519016, alpha: 1) )  , neutralTwo:  Color( #colorLiteral(red: 0.1442590058, green: 0.1522315443, blue: 0.2122519016, alpha: 1) )
    )
}

extension FilterDataClass{
    func bindingCommands(){
        self.sheetBindingVariables.isPresented = false
        self.sheetBindingVariables.isSheetContent = 0
        self.sheetBindingVariables.myOffset.height = 300
    }
    func FilterCheckBoxForTypes(currentInfo: String, givenImageString: String, givenContent: String, typeFont: Font, imageSize: Double, numColor: Color, isBold: Bool, chosenTypes: [String]) -> some View{
        HStack{
            TextSetup(stringContent: "\(givenContent)", typeFont: typeFont, isBold: isBold, numOffset: 5, numOffsetY: 0, numColor: numColor)
            Spacer()
            ZStack{
                SystemImageSetup(numColor: chosenTypes.contains("\(currentInfo)") ? self.ColorScheme.neutralOne : numColor, systemImage: "\(givenImageString)", imageWidth: imageSize, imageHeight: imageSize)
                if chosenTypes.contains("\(currentInfo)") == true {
                    SystemImageSetup(numColor: chosenTypes.contains("\(currentInfo)") ? self.ColorScheme.neutralOne : numColor, systemImage: "circle.fill", imageWidth: imageSize / 1.5, imageHeight: imageSize / 1.5)
                }

            }
            .opacity(chosenTypes.contains("\(currentInfo)") ? 1 : 0.4)
        }
    }
    func FilterCheckBoxForGens(currentInfo: String, givenImageString: String, givenContent: String, typeFont: Font, imageSize: Double, numColor: Color, isBold: Bool, chosenGen: [String]) -> some View{
        HStack{
            TextSetup(stringContent: "\(givenContent)", typeFont: typeFont, isBold: isBold, numOffset: 5, numOffsetY: 0, numColor: numColor)
            Spacer()
            ZStack{
                SystemImageSetup(numColor: chosenGen.contains("\(currentInfo)") ? self.ColorScheme.neutralOne : numColor, systemImage: "\(givenImageString)", imageWidth: imageSize, imageHeight: imageSize)
                if chosenGen.contains("\(currentInfo)") == true {
                    SystemImageSetup(numColor: chosenGen.contains("\(currentInfo)") ? self.ColorScheme.neutralOne : numColor, systemImage: "circle.fill", imageWidth: imageSize / 1.5, imageHeight: imageSize / 1.5)
                }
                
            }
            .opacity(chosenGen.contains("\(currentInfo)") ? 1 : 0.4)
        }
    }
    func FilterCheckBoxForStats(currentInfo: String, givenImageString: String, givenContent: String, typeFont: Font, imageSize: Double, numColor: Color, isBold: Bool, chosenStat: String) -> some View{
        HStack{
            TextSetup(stringContent: "\(givenContent)", typeFont: typeFont, isBold: isBold, numOffset: 5, numOffsetY: 0, numColor: numColor)
            Spacer()
            ZStack{
                SystemImageSetup(numColor: chosenStat == currentInfo ? self.ColorScheme.neutralOne : numColor, systemImage: "\(givenImageString)", imageWidth: imageSize, imageHeight: imageSize)
                if chosenStat == currentInfo {
                    SystemImageSetup(numColor: chosenStat == currentInfo ? self.ColorScheme.neutralOne : numColor, systemImage: "circle.fill", imageWidth: imageSize / 1.5, imageHeight: imageSize / 1.5)
                }
               
            }
            .opacity(chosenStat == currentInfo ? 1 : 0.4)
        }
    }
}
extension FilterDataClass{
    func activateLight(item: String){
        print("light mode activated : filter function not written")
        print("activateLight function has been RUN : More Info -> MainData File \n")
    }
    func activateDark(item: String){
        print("dark mode activated : filter function not written")
        print("activateDark function has been RUN : More Info -> MainData File \n")
    }
}


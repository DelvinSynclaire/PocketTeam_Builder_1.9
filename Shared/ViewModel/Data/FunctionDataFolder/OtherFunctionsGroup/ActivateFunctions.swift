//
//  ActivateFunctions.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 9/4/22.
//

import Foundation
import SwiftUI

extension MainData{
    
    // activate functions
    func activateMega(item: String){
        filterMega()
        withAnimation(self.mySpring){
            self.specialEvolutionData.chosenEvolution[item]!.toggle()
            
            if self.specialEvolutionData.chosenEvolution[item] == true {
                self.specialEvolutionData.specialEvoOffsetMega = 0
            } else {
                self.specialEvolutionData.specialEvoOffsetMega = 200
            }
        }
       
        print("activateMega function has been RUN : More Info -> MainData File")
    }
    func activateGiga(item: String){
        filterGiga()
        withAnimation(self.mySpring){
            self.specialEvolutionData.chosenEvolution[item]!.toggle()
            
            if self.specialEvolutionData.chosenEvolution[item] == true {
                self.specialEvolutionData.specialEvoOffsetGiga = 0
            } else {
                self.specialEvolutionData.specialEvoOffsetGiga = 200
            }
        }
        
        print("activateGiga function has been RUN : More Info -> MainData File")
    }
    // ACTIVATE LIST
    func activateList(item: String){
        orientationFilter(number: 2)
        withAnimation(self.mySpring){
            if self.appearanceData.activeAppearances.contains("List") == false {
                self.appearanceData.listOffset = 0
                self.appearanceData.gridOffset = 200
                let index = self.appearanceData.activeAppearances.firstIndex(of: "Grid")
                self.appearanceData.activeAppearances.remove(at: index!)
                self.appearanceData.activeAppearances.append("List")
            }
        }
        print("activateList function has been RUN : More Info -> MainData File \n")
    }
    // ACTIVATE GRID
    func activateGrid(item: String){
        orientationFilter(number: 1)
        withAnimation(self.mySpring){
            if self.appearanceData.activeAppearances.contains("Grid") == false {
                self.appearanceData.listOffset = 200
                self.appearanceData.gridOffset = 0
                let index = self.appearanceData.activeAppearances.firstIndex(of: "List")
                self.appearanceData.activeAppearances.remove(at: index!)
                self.appearanceData.activeAppearances.append("Grid")
            }
        }
        print("activateGrid function has been RUN : More Info -> MainData File \n")
    }
    // ACTIVATE LIGHT MODE
    func activateLight(item: String){
        let LightColorScheme = colorScheme(words: Color( #colorLiteral(red: 0.1537064612, green: 0.1574473679, blue: 0.197665751, alpha: 1) ) , backgroundOne:  Color( #colorLiteral(red: 0.736397624, green: 0.852484405, blue: 0.8485863805, alpha: 1) )  , backgroundTwo:  Color( #colorLiteral(red: 0.768197, green: 0.8950389028, blue: 0.8317549825, alpha: 1) )  , tiles:  Color( #colorLiteral(red: 0.7437219024, green: 0.8593150377, blue: 0.8665470481, alpha: 1) )  , accentOne:  Color( #colorLiteral(red: 0.9369754195, green: 0.8287350535, blue: 0.730240047, alpha: 1) )  , accentTwo:  Color( #colorLiteral(red: 0.9197416902, green: 0.7386668921, blue: 0.712102592, alpha: 1) )  , neutralOne:  Color( #colorLiteral(red: 0.9595448375, green: 0.9865084291, blue: 0.9864633679, alpha: 1) )  , neutralTwo:  Color( #colorLiteral(red: 0.9185807109, green: 0.9558623433, blue: 0.9594259858, alpha: 1) ))
        self.ColorScheme = LightColorScheme
        withAnimation(self.mySpring){
            if self.appearanceData.activeAppearances.contains("Light Mode") == false {
                self.appearanceData.darkOffset = 200
                self.appearanceData.lightOffset = 0
                let index = self.appearanceData.activeAppearances.firstIndex(of: "Dark Mode")
                self.appearanceData.activeAppearances.remove(at: index!)
                self.appearanceData.activeAppearances.append("Light Mode")
            }
        }
        print("light mode activated : filter function not written")
        print("activateLight function has been RUN : More Info -> MainData File \n")
    }
    // ACTIVATE DARK MODE
    func activateDark(item: String){
        let DarkColorScheme = colorScheme(words:Color( #colorLiteral(red: 0.8421192169, green: 0.8518281579, blue: 0.8814193606, alpha: 1) ) , backgroundOne:  Color( #colorLiteral(red: 0.02922186171, green: 0.5932041103, blue: 0.5527039348, alpha: 1) )  , backgroundTwo:  Color( #colorLiteral(red: 0.768197, green: 0.8950389028, blue: 0.8317549825, alpha: 1) )  , tiles:  Color( #colorLiteral(red: 0.2255600691, green: 0.2802819312, blue: 0.3658496141, alpha: 1) )  , accentOne:   Color( #colorLiteral(red: 0.9197416902, green: 0.7386668921, blue: 0.712102592, alpha: 1) )  , accentTwo: Color( #colorLiteral(red: 0.9369754195, green: 0.8287350535, blue: 0.730240047, alpha: 1) )  , neutralOne:   Color( #colorLiteral(red: 0.1537064612, green: 0.1574473679, blue: 0.197665751, alpha: 1) )  , neutralTwo:  Color( #colorLiteral(red: 0.2103239, green: 0.2046396136, blue: 0.248021841, alpha: 1) ))
        self.ColorScheme = DarkColorScheme
        withAnimation(self.mySpring){
            if self.appearanceData.activeAppearances.contains("Dark Mode") == false {
                self.appearanceData.darkOffset = 0
                self.appearanceData.lightOffset = 200
                let index = self.appearanceData.activeAppearances.firstIndex(of: "Light Mode")
                self.appearanceData.activeAppearances.remove(at: index!)
                self.appearanceData.activeAppearances.append("Dark Mode")
            }
        }
        print("dark mode activated : filter function not written")
        print("activateDark function has been RUN : More Info -> MainData File \n")
    }
    
    
    func activateSearchButton(){
        if self.callSearchedPokemon(poke: self.searchPokemon){
            self.addSearchedPokemon(poke: self.searchPokemon)
            self.searchPokemon = ""
            self.pageData.pageNumber = 3
        } else {
            print("\(self.searchPokemon) was not added")
            self.searchPokemon = ""
        }
    }
}



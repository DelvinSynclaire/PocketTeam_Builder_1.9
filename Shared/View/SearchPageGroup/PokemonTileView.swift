//
//  SearchPage.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 8/6/22.
//

import Foundation
import SwiftUI


struct PokemonView: View {
    @EnvironmentObject var mainData: MainData
    @Binding var isReady: Bool
    @State var myOffset: CGFloat = 75
    
    var body: some View{
        let arraySelection = [
            mainData.PokemonArray,
            mainData.PokemonTypeArray
        ]
        
        ScrollView{
                LazyVGrid(columns: mainData.columnData.columns){
                    ForEach(arraySelection[mainData.pokemonTypeData.arraySelectionInt], id: \.id){ poke in
                        mainData.GridOrList(poke: poke, myOffset: myOffset)
                    }
                }
            }
        .onAppear{
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                if mainData.PokemonArray.count > 1112{
                    
                    timer.invalidate()
                }
            }
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                if mainData.PokemonArray[0].id == 1{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                        withAnimation(mainData.mySpring){
                                myOffset = 0
                            }
                    }
                    timer.invalidate()

                } else{
                    if mainData.pokemonStatData.chosenStat == "none"{
                        mainData.PokemonArray.sort(by: {$0.id < $1.id})
                    } else{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                            withAnimation(mainData.mySpring){
                                    myOffset = 0
                                }
                        }
                        timer.invalidate()
                    }
                    print("PokemonArray SORTED : More Info -> SearchPage File -> struct PokemonView \n")
                }
            }
        }
    }
}


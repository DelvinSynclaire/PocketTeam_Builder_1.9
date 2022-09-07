//
//  StatPage.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 8/8/22.
//

import Foundation
import SwiftUI

//struct StatPageTwo: View{
//    @EnvironmentObject var mainData: MainData
//    let backColor = #colorLiteral(red: 0.2753649187, green: 0.2591902169, blue: 0.3235945555, alpha: 1)
//
//    var body: some View{
//        ZStack {
//            VStack{
//                Spacer()
//                RoundedRectangle(cornerRadius: 35)
//                    .fill(Color(backColor))
//                    .ignoresSafeArea()
//                    .frame(width: mainData.pageData.pageWidth, height: mainData.pageData.pageHeight / 1.3)
//            }
//            .frame(width: mainData.pageData.pageWidth, height: mainData.pageData.pageHeight)
//            if mainData.CurrentPokemonStatPage.currentPokemon.count > 0{
//                ForEach(mainData.CurrentPokemonStatPage.currentPokemon, id: \.id){ poke in
//                    VStack{
//                        VStack{
//                            TopBarView()
//                                .frame(height: mainData.pageData.pageHeight / 20)
//                            HStack {
//                                Text("\(poke.name.capitalizingFirstLetter())")
//                                    .font(.system(size: 50))
//                                Spacer()
//                                Text("\(poke.id)")
//                            }
//                            .padding()
//                            .frame(height: mainData.pageData.pageHeight / 20)
//                            // Here are the types below the name of the Pokemon
//                            HStack{
//                                ForEach(mainData.pokemonTypeData.allTypes, id: \.self){ type in
//                                    if type == poke.types[0].type.name{
//                                        ZStack{
//                                            RoundedRectangle(cornerRadius: 25)
//                                                .fill(mainData.pokemonTypeData.typeColors[mainData.pokemonTypeData.index!])
//                                                .frame(width: mainData.pageData.pageWidth / 4, height: mainData.pageData.pageHeight / 22)
//                                            HStack {
//                                                Image("\(type)")
//                                                    .resizable()
//                                                    .scaledToFit()
//
//                                                .frame(width: mainData.pageData.pageWidth / 20, height: mainData.pageData.pageHeight / 20)
//                                                Text("\(type.capitalizingFirstLetter())")
//                                                    .bold()
//                                                    .font(.headline)
//                                            }
//                                        }
//                                        .onAppear{
//                                            let index = mainData.pokemonTypeData.allTypes.firstIndex(of: poke.types[0].type.name)
//                                            mainData.pokemonTypeData.index = index
//                                        }
//                                    }
//                                }
//                                ForEach(mainData.pokemonTypeData.allTypes, id: \.self){ type in
//                                    if poke.types.count > 1 && type == poke.types[1].type.name{
//                                        ZStack{
//                                            RoundedRectangle(cornerRadius: 25)
//                                                .fill(mainData.pokemonTypeData.typeColors[mainData.pokemonTypeData.indexTwo!])
//                                                .frame(width: mainData.pageData.pageWidth / 4, height: mainData.pageData.pageHeight / 22)
//                                            HStack {
//                                                Image("\(type)")
//                                                    .resizable()
//                                                    .scaledToFit()
//                                                .frame(width: mainData.pageData.pageWidth / 18, height: mainData.pageData.pageHeight / 18)
//                                                Text("\(type.capitalizingFirstLetter())")
//                                                    .bold()
//                                                    .font(.headline)
//                                            }
//                                        }
//                                        .offset(x: 15)
//                                        .onAppear{
//                                            let index = mainData.pokemonTypeData.allTypes.firstIndex(of: poke.types[1].type.name)
//                                            mainData.pokemonTypeData.indexTwo = index
//                                        }
//                                    }
//                                }
//
//                                Spacer()
//                            }
//                            .frame(height: mainData.pageData.pageHeight / 20)
//                            .padding()
//                        }
//                        Spacer()
//                        // Here is the pokemon image
//                        AsyncImage(url: mainData.ImagePokemonDictionary[poke.name]!){ image in
//                            image
//                                .resizable()
//                                .scaledToFit()
//                        } placeholder: {
//                            Color.purple
//                        }
//                        .frame(height: mainData.pageData.pageHeight / 3)
//                        Spacer()
//                        StatMarkers()
//                        ScrollView(.horizontal){
//                            HStack{
//                                StatSubView()
//                                VStack{
//                                    ForEach(mainData.CurrentPokemonStatPage.currentPokemon, id: \.name){ poke in
//                                        Text("\(poke.order)")
//                                    }
//                                }
//                                .offset(x: 100)
//                            }
//                        }
//                        Spacer()
//                    }
//                    .foregroundColor(Color.black)
//                    .frame(width: mainData.pageData.pageWidth / 1.25, height: mainData.pageData.pageHeight)
//                }
//            }
//        }
//    }
//}
//
//struct TopBarView: View{
//    @EnvironmentObject var mainData: MainData
//
//    var body: some View{
//        HStack{
//            Button {
//                        mainData.pageData.pageNumber -= 2
//                    } label: {
//                        Image(systemName: "arrow.left")
//                            .resizable()
//                            .scaledToFit()
//                           // .background(Color.blue)
//                    }
//
//            Spacer()
//            Image(systemName: "heart")
//                .resizable()
//                .scaledToFit()
//                .onTapGesture{
//                    mainData.MainTeam.append(mainData.CurrentPokemonStatPage.currentPokemon[0])
//                    mainData.pageData.pageNumber = 1
//                    print("the number of pokemon on your team is: \(mainData.MainTeam.count)")
//                }
//        }
//        .frame(height: mainData.pageData.pageHeight / 45)
//        .padding()
//    }
//}
//struct StatMarkers: View{
//    @EnvironmentObject var mainData: MainData
//    let markers = ["Stat", "About", "Something", "Something"]
//
//    var body: some View{
//        HStack{
//            ForEach(markers, id: \.self){ marker in
//                let index = markers.firstIndex(of: marker)
//                VStack{
//                    Text("\(marker)")
//                        .bold()
//                        .font(.headline)
//                    RoundedRectangle(cornerRadius: 10)
//                        .fill(mainData.pokemonStatData.chosenMarker == index ? Color.blue : Color.clear)
//                        .padding(.leading)
//                        .frame(width: mainData.pageData.pageWidth / 5 ,height: 2)
//                }
//                .frame(width: mainData.pageData.pageWidth / 4)
//            }
//        }
//        .padding()
//        .frame(width: mainData.pageData.pageWidth)
//    }
//}
//struct StatSubView: View {
//    @EnvironmentObject var mainData: MainData
//    @State var offsetAnimation : CGFloat = 150
//    let barColor = #colorLiteral(red: 0.2753649187, green: 0.2591902169, blue: 0.3235945555, alpha: 1)
//    let barColorTwo = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
//
//    var body: some View {
//            let pokemon : Pokemon = mainData.CurrentPokemonStatPage.currentPokemon[0]
//
//        VStack(alignment: .leading){
//            ForEach(mainData.pokemonStatData.allStats, id: \.self){ stat in
//                let index = mainData.pokemonStatData.allStats.firstIndex(of: stat)
//                HStack {
//                    HStack {
//                        Text("\(mainData.pokemonStatData.shortStats[index ?? 1])")
//                        Spacer()
//                        Text("\(pokemon.stats[index ?? 0].base_stat)")
//                    }
//                    .frame(width: mainData.pageData.pageWidth / 5.5)
//                    Spacer()
//                    // here are thetop lines if the stat lines
//                    ZStack{
//                        RoundedRectangle(cornerRadius: 10)
//                            .fill(pokemon.stats[index ?? 0].base_stat > 35 ? Color(barColorTwo) : Color.clear)
//                            .frame(width: mainData.pageData.pageWidth / 2, height: 4.5)
//                        RoundedRectangle(cornerRadius: 10)
//                            .fill(mainData.pokemonTypeData.typeColors[mainData.pokemonTypeData.index!])
//                            .frame(width: mainData.pageData.pageWidth / 2, height: 8)
//                            .mask(
//                                    HStack{
//                                            RoundedRectangle(cornerRadius: 10)
//                                                .offset(x: (-offsetAnimation * CGFloat(index! + 1)))
//                                                .frame(width:
//                                                       CGFloat(pokemon.stats[index ?? 0].base_stat * 2 - 25)
//                                                       , height: 8)
//                                        Spacer()
//                                    }
//                                    .frame(width: mainData.pageData.pageWidth / 2)
//                            )
//                        if CGFloat(pokemon.stats[index ?? 0].base_stat) > 101 {
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(Color(barColorTwo))
//                                .frame(width: mainData.pageData.pageWidth / 2, height: 10)
//                                .mask(
//                                    HStack{
//                                            RoundedRectangle(cornerRadius: 10)
//                                                .offset(x: (-offsetAnimation * CGFloat(index! + 1)))
//                                                .frame(width: CGFloat(pokemon.stats[index ?? 0].base_stat - 75)
//                                                       , height: 10)
//                                        Spacer()
//                                    }
//                                    .frame(width: mainData.pageData.pageWidth / 2)
//                                )
//                        }
//
//                    }
//                    Spacer()
//                }
//                .onAppear{
//                    let animation = Animation.spring().delay(0.5)
//                    withAnimation(animation){
//                            offsetAnimation = 0
//                    }
//                }
//            }
//        }
//    }
//}

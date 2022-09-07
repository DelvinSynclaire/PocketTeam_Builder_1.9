//
//  ContentView.swift
//  Shared
//
//  Created by Delvin Cockroft on 7/30/22.
//

import SwiftUI

struct ContentView: View {
    @State var pokedexData : ListOfPokemon?
    @StateObject var mainData = MainData()
    
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                MainPage()
                    .onAppear{
                        mainData.pageData.pageHeight = geo.size.height
                        mainData.pageData.pageWidth = geo.size.width
                    }
            }
            .environmentObject(mainData)
        }
    }

}


struct MainPage: View {
    @EnvironmentObject var mainData: MainData
    
    var body: some View {
        ZStack{
            if mainData.pageData.pageNumber == 0{
                OpeningPage()
                    .onDisappear{
                        print("Opening Page closed!")
                    }
            } else if mainData.pageData.pageNumber == 1{
                SearchPage()
                    .onDisappear{
                        print("Search Page closed!")
                    }
            } else if mainData.pageData.pageNumber == 2{
                FilterPage()
                    .transition(.slide)
                    .onDisappear{
                        print("Filer Page closed!")
                    }
            } else if mainData.pageData.pageNumber == 3{
                StatPage()
                    .transition(.move(edge: .bottom))
                    .onDisappear{
                        print("Stat Page closed!")
                    }
            }
            else if mainData.pageData.pageNumber == 4{
                MainTeamPage()
                    .transition(.move(edge: .leading))
                    .onDisappear{
                        print("Team Page closed!")
                    }
            }
        }
        .background(
            Color.white
                .ignoresSafeArea()
                .frame(width: mainData.pageData.pageWidth, height: mainData.pageData.pageHeight)
        )
        .frame(width: mainData.pageData.pageWidth, height: mainData.pageData.pageHeight)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

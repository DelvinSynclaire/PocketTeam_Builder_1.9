//
//  StatContentCarousel.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 8/29/22.
//

import Foundation
import SwiftUI

struct StatContentCarousel : View {
    @EnvironmentObject var mainData: MainData
    @State private var offset = CGSize.zero

    var body: some View{
        VStack{
            CarouselHeader()
            HStack{
                Text("Main Info")
                    .font(.title)
                    .bold()
                    .foregroundColor(mainData.ColorScheme.words)
                Spacer()
            }
            .padding(.leading)
            .frame(width: mainData.pageData.pageWidth / 1.1)
            MainViewForCarousel()
        }
    }
}


class Store: ObservableObject {
    @Published var items: [Item]
    
    let colors: [Color] = [.red, .orange, .blue, .teal, .mint, .green, .gray, .indigo, .black]

    // dummy data
    init() {
        items = [
            Item(id: 1, title: "About", color: colors[1], dragID: 1.0, content: AnyView(AboutSubView())),
            Item(id: 2, title: "Statistics", color: colors[2], dragID: 2.0, content: AnyView(StatisticsSubView())),
            Item(id: 3, title: "Evolutions", color: colors[3], dragID: -1.0, content: AnyView(EvolutionsSubView())),
            Item(id: 4, title: "More Info", color: colors[4], dragID: 0.0, content: AnyView(MoreInfoSubView()))
        ]

    }
}
struct MainViewForCarousel: View {
    @EnvironmentObject var mainData: MainData

    var body: some View {
        VStack{
            // testing drag -> Text("\(mainData.draggingItem)")
            ZStack {
                ForEach(mainData.store.items) { item in
                    // article view
                    VStack {
                        VStack{
                            if abs(mainData.distance(item.id)) * 1 == 0{
                                item.content
                            }
                        }
                        Spacer()
                    }
                    .padding()
                    .testingBackground(isTesting: mainData.TESTING_HighlightBackGround, chosenColor: 5)
                    .opacity(1.0 - abs(mainData.distance(item.id)) * 1 )
                    .offset(x: mainData.myXOffset(item.id), y: 0)
                    .zIndex(1.0 - abs(mainData.distance(item.id)) * 0.1)
                    .frame(width: mainData.pageData.pageWidth / 1.1, height: mainData.pageData.pageHeight / 2)
                }
            }
            .testingBackground(isTesting: mainData.TESTING_HighlightBackGround, chosenColor: 6)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        mainData.draggingItem = mainData.snappedItem - value.translation.width / 400
                    }
                    .onEnded { value in
                        withAnimation(mainData.mySpring) {
                            mainData.draggingItem = mainData.snappedItem - value.predictedEndTranslation.width / 500
                            mainData.draggingItem = round(mainData.draggingItem).remainder(dividingBy: Double(mainData.store.items.count))
                            mainData.snappedItem = mainData.draggingItem
                        }
                    }
            )
        }
        
    }
}

struct CarouselHeader: View {
    @EnvironmentObject var mainData: MainData

    var body: some View{
        HStack{
            ForEach(mainData.store.items, id: \.id){ item in
                Spacer()
                VStack{
                    Text("\(item.title)")
                        .foregroundColor(mainData.ColorScheme.words)
                    if item.dragID == mainData.draggingItem{
                        Rectangle()
                            .fill(mainData.ColorScheme.words)
                            .frame(width: 75, height: 2)
                    } else {
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width: 75, height: 2)
                    }
                }
                .onTapGesture {
                    withAnimation(mainData.mySpring){
                        mainData.draggingItem = item.dragID
                    }
                }
                Spacer()
            }
        }

        
    }
}



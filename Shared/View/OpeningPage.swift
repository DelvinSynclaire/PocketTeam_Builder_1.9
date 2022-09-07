//
//  OpeningPage.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 8/6/22.
//

import Foundation
import SwiftUI

struct OpeningPage: View{
    @EnvironmentObject var mainData: MainData
    var ColorArray = [#colorLiteral(red: 0.9965625405, green: 0.62161237, blue: 0.5253461599, alpha: 1) , #colorLiteral(red: 0.3747600913, green: 0.3455332518, blue: 0.3589158058, alpha: 1), #colorLiteral(red: 0.7834402919, green: 0.9300879836, blue: 0.7935171723, alpha: 1), #colorLiteral(red: 0.9219809175, green: 0.9523845315, blue: 0.9595871568, alpha: 1)]

    var body: some View{
        
        ZStack{
            textView()
            VStack{
                Spacer()
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .frame(width: mainData.pageData.pageWidth / 1.2, height: mainData.pageData.pageHeight / 20)
                    .overlay(Text("Enter").font(.title).foregroundColor(Color.black))
                      .onTapGesture {
                          let animation = Animation.easeIn
                          withAnimation(animation){
                              mainData.pageData.pageNumber = 1
                          }
                      }
            }
            .frame(width: mainData.pageData.pageWidth, height: mainData.pageData.pageHeight / 1.2)
        }
        .background(Color(ColorArray[0]))
    }
}

struct textView: View {
    @EnvironmentObject var mainData: MainData
    var ColorArray = [#colorLiteral(red: 0.9965625405, green: 0.62161237, blue: 0.5253461599, alpha: 1) , #colorLiteral(red: 0.3747600913, green: 0.3455332518, blue: 0.3589158058, alpha: 1), #colorLiteral(red: 0.7834402919, green: 0.9300879836, blue: 0.7935171723, alpha: 1), #colorLiteral(red: 0.9219809175, green: 0.9523845315, blue: 0.9595871568, alpha: 1)]

    var body: some View{
        // inside stack for all content
        VStack(alignment: .center){
            Image("Pokeball-1")
                .resizable()
                .scaledToFit()
            Spacer()
            Text("Welcome to the world of Pokemon")
                .bold()
                .padding()
                .font(.title)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)

            Text("Whether it is for your next playthrough, your \nlove of pokemon or for a competition, let's \nmake the most amazing team together")
                .bold()
                .multilineTextAlignment(.center)
                .padding()
                .font(.headline)
                .foregroundColor(Color(ColorArray[1]))
            Spacer()
         
        }
        .frame(width: mainData.pageData.pageWidth, height: mainData.pageData.pageHeight)
    }
}

struct loadingPage: View{
    @EnvironmentObject var mainData: MainData
    @State private var loading : CGFloat = 0

    var body: some View{
        let animationSetup = AnimationSetupForImage(x: 0, y: 150, animaiton: mainData.mySpring, delay: DispatchTime(uptimeNanoseconds: 0))

        ZStack{
            mainData.ColorScheme.backgroundTwo
                .ignoresSafeArea()
            ZStack{
                mainData.ImageSetup(isProgramImage: false,stringImage: "pokeball (2)", stringURLImage: "pokeball (2)", imageWidth: 100, imageHeight: 100, AnimationSetup: animationSetup)
                Circle()
                    .trim(from: 0, to: loading) // 1
                    .rotation(.degrees(-90))
                    .stroke(
                        mainData.ColorScheme.words,
                        style: StrokeStyle(
                            lineWidth: 15,
                            lineCap: .round
                        )
                    )
                    .frame(width: 130, height: 130)
            }
        }
        .onAppear{
            Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
                if mainData.PokemonArray.count == 1113{
                    timer.invalidate()
                } else {
                    withAnimation(mainData.mySpring){
                        loading = loading + CGFloat(Double(mainData.PokemonArray.count) * 0.000135)
                    }
                }
            }
            
        }
    }
}




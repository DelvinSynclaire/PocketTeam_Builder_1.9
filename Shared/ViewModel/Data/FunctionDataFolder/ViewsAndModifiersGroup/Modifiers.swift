//
//  Modifiers.swift
//  PokeTeam_1.8 (iOS)
//
//  Created by Delvin Cockroft on 9/4/22.
//

import Foundation
import SwiftUI

// MARK: VIEW Modifiers
struct OffsetAnimation : ViewModifier{
    @State var offsetX: CGFloat?
    @State var offsetY: CGFloat?
    var mySpring : Animation?
    var delay : DispatchTime?

    func body(content: Content) -> some View {
        content
            .offset(x: offsetX ?? 0, y: offsetY ?? 0)
            .onAppear{
                let animation = Animation.spring()
                DispatchQueue.main.asyncAfter(deadline: delay!){
                    withAnimation(mySpring ?? animation){
                        offsetX = 0
                        offsetY = 0
                    }
                }
            }
    }
}
struct ScaleAnimation : ViewModifier{
    @State var scale: CGFloat?
    var mySpring : Animation?
    var delay : DispatchTime?

    func body(content: Content) -> some View {
        content
            .scaleEffect(scale!)
            .onAppear{
                let animation = Animation.spring()
                DispatchQueue.main.asyncAfter(deadline: delay!){
                    withAnimation(mySpring ?? animation){
                        scale = 1
                    }
                }
                
            }
    }
}

struct TestingBackground : ViewModifier{
    var isTesting : Bool?
    var chosenColor : Int?
    let testColors = [
        Color.red,
        Color.blue,
        Color.pink,
        Color.green,
        Color.orange,
        Color.purple,
        Color.teal
    ]

    func body(content: Content) -> some View {
        content
            .background(
                ZStack{
                    if isTesting! == true {
                        testColors[chosenColor!]
                    }
                }
            )
    }
}

extension View{
    public func offsetAxisAnimation(x: CGFloat, y: CGFloat, mySpring : Animation?, delay: DispatchTime?) -> some View{
        modifier(OffsetAnimation(offsetX: x,offsetY: y, mySpring : mySpring, delay: delay))
    }
    public func scaleAnimation(scale: CGFloat, mySpring : Animation?, delay: DispatchTime?) -> some View{
        modifier(ScaleAnimation(scale: scale , mySpring: mySpring, delay: delay))
    }
    public func testingBackground(isTesting: Bool, chosenColor: Int) -> some View{
        modifier(TestingBackground(isTesting: isTesting, chosenColor: chosenColor))
    }
}


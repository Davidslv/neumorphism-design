 //
//  ContentView.swift
//  Neumorphism
//
//  Created by David Silva on 01/04/2020.
//  Copyright © 2020 David Silva. All rights reserved.
//

import SwiftUI
 
struct SimpleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Circle())
            .background(
                Group {
                    if configuration.isPressed {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.offWhite)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.gray, lineWidth: 4)
                                    .blur(radius: 4)
                                    .offset(x: 2, y: 2)
                                .mask(
                                    RoundedRectangle(cornerRadius: 25)
                                    .fill(LinearGradient(Color.black, Color.clear))
                                )
                            )
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.white, lineWidth: 8)
                                .blur(radius: 4)
                                .offset(x: -2, y: -2)
                            .mask(
                                RoundedRectangle(cornerRadius: 25)
                                .fill(LinearGradient(Color.clear, Color.black)))
                        )
                    }
                    else {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.offWhite)
                            .shadow(
                                color: Color.black.opacity(0.2),
                                radius: 10,
                                x: 10,
                                y: 10
                            )
                            .shadow(
                                color: Color.white.opacity(0.7),
                                radius: 10,
                                x: -5,
                                y: -5
                            )
                    }
                }
        )
    }
}
 
 // Generic background which can be used anywhere
 struct DarkBackground<S: Shape> : View {
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    // fill Pillow Effect
                    .fill(LinearGradient(Color.darkEnd, Color.darkStart))
                    .overlay(
                        shape
                            .stroke(
                                LinearGradient(Color.lightStart, Color.lightEnd),
                                lineWidth: 4
                            )
                    )
                    .shadow(color: Color.darkStart, radius: 10, x: 5, y: 5)
                    .shadow(color: Color.darkEnd, radius: 10, x: -5, y: -5)
            }
            else {
                shape
                    // fill Pillow Effect
                    .fill(LinearGradient(Color.darkStart, Color.darkEnd))
                    .overlay(
                        shape
                            .stroke(
                                LinearGradient(Color.lightStart, Color.lightEnd),
                                lineWidth: 4
                            )
                    )
                    .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
            }
        }
    }
 }
 
 struct DarkButtonStyle: ButtonStyle {
     func makeBody(configuration: Configuration) -> some View {
         configuration.label
         .padding(30)
         .contentShape(RoundedRectangle(cornerRadius: 25))
         .background(
             DarkBackground(isHighlighted: configuration.isPressed, shape: RoundedRectangle(cornerRadius: 25))
         )
         .animation(nil)
         
     }
  }
  
 struct DarkToggleStyle: ToggleStyle {
      func makeBody(configuration: Self.Configuration) -> some View {
          Button(action: {
              configuration.isOn.toggle()
          }) {
              configuration.label
                  .padding(30)
                  .contentShape(RoundedRectangle(cornerRadius: 25))
          }
          .background(
              DarkBackground(isHighlighted: configuration.isOn, shape: RoundedRectangle(cornerRadius: 25))
          )
      }
  }
 
 struct ColorfulBackground<S: Shape> : View {
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    // fill Pillow Effect
                    .fill(LinearGradient(Color.lightEnd, Color.lightStart))
                    .overlay(
                        shape
                            .stroke(
                                LinearGradient(Color.lightStart, Color.lightEnd),
                                lineWidth: 4
                            )
                    )
                    .shadow(color: Color.darkStart, radius: 10, x: 5, y: 5)
                    .shadow(color: Color.darkEnd, radius: 10, x: -5, y: -5)
            }
            else {
                shape
                    // fill Pillow Effect
                    .fill(LinearGradient(Color.lightStart, Color.lightEnd))
                    .overlay(
                        shape
                            .stroke(
                                Color.lightEnd,
                                lineWidth: 4
                            )
                    )
                    .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
            }
        }
    }
 }
 
 


 struct ColorfulButtonStyle: ButtonStyle {
     func makeBody(configuration: Configuration) -> some View {
         configuration.label
         .padding(30)
         .contentShape(RoundedRectangle(cornerRadius: 25))
         .background(
             DarkBackground(isHighlighted: configuration.isPressed, shape: RoundedRectangle(cornerRadius: 25))
         )
         .animation(nil)
         
     }
  }
  
 struct ColorfulToggleStyle: ToggleStyle {
      func makeBody(configuration: Self.Configuration) -> some View {
          Button(action: {
              configuration.isOn.toggle()
          }) {
              configuration.label
                  .padding(30)
                  .contentShape(RoundedRectangle(cornerRadius: 25))
          }
          .background(
              DarkBackground(isHighlighted: configuration.isOn, shape: RoundedRectangle(cornerRadius: 25))
          )
      }
  }

 
struct ContentView: View {
    @State private var isToggled = false
    
    var body: some View {
        
        VStack {            
            ZStack {
                // NeuMorphism Card
                Color.offWhite
                LinearGradient(Color.darkStart, Color.darkEnd)
                
                HStack(spacing: 40) {
                    VStack(spacing: 40) {
                        Button(action: {
                            print("Btn Tapped")
                        }) {
                            Image(systemName: "heart.fill").foregroundColor(.lightStart)
                        }
                        .buttonStyle(DarkButtonStyle())
                        .zIndex(1)
                        
                        Toggle(isOn: $isToggled) {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.white)
                        }
                        .toggleStyle(DarkToggleStyle())
                    }
                    
                    VStack(spacing: 40) {
                         Button(action: {
                             print("Btn Tapped")
                         }) {
                             Image(systemName: "heart.fill").foregroundColor(.offWhite)
                         }
                         .buttonStyle(ColorfulButtonStyle())
                         .zIndex(1)
                         
                        
                        Toggle(isOn: $isToggled) {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.white)
                        }
                        .toggleStyle(ColorfulToggleStyle())
                        
                     }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

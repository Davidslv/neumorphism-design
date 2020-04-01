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
                        Circle()
                            .fill(Color.offWhite)
                            .overlay(
                                Circle()
                                    .stroke(Color.gray, lineWidth: 4)
                                    .blur(radius: 4)
                                    .offset(x: 2, y: 2)
                                .mask(
                                    Circle()
                                    .fill(LinearGradient(Color.black, Color.clear))
                                )
                            )
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 8)
                                .blur(radius: 4)
                                .offset(x: -2, y: -2)
                            .mask(
                                Circle()
                                .fill(LinearGradient(Color.clear, Color.black)))
                        )
                    }
                    else {
                        Circle()
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

struct ContentView: View {
    var body: some View {
        
        VStack {            
            ZStack {
                // NeuMorphism Card
                Color.offWhite
                LinearGradient(Color.darkStart, Color.darkEnd)
                
                Button(action: {
                    print("Btn Tapped")
                }) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.gray)
                }
                .buttonStyle(SimpleButtonStyle())
                .zIndex(1)

                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.offWhite)
                    .frame(width: 300, height: 300)
                .zIndex(0)
                .shadow(
                    color: Color.black.opacity(0.2),
                    radius: 10,
                    x: 10,
                    y: 10
                )
                .shadow(
                    color: Color.white.opacity(0.66),
                    radius: 10,
                    x: -5,
                    y: -5
                )
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

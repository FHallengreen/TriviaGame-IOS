//
//  ContentView.swift
//  TriviaGameIOS
//
//  Created by Frederik Hansen on 17/12/2023.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        NavigationView {
            VStack(
                spacing: 20
            ){
                Text("Welcome to Fred's Pub Quiz")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.accentColor)
                
                GeometryReader { geometry in
                    Image("PubQuizLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: min(geometry.size.width, geometry.size.height))
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }
                .frame(height: 200)
                
                NavigationButton(text: "Start new quiz",destination:SelectOptionsScreen())
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background(
            .white
        )
    }
}

#Preview {
    WelcomeScreen()
}

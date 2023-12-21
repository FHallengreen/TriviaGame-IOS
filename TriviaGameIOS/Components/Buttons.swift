//
//  PrimaryButton.swift
//  TriviaGameIOS
//
//  Created by Frederik Hansen on 17/12/2023.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ButtonAppearance(text: text)
        }
    }
}

struct NavigationButton<Destination: View>: View {
    var text: String
    var destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            ButtonAppearance(text: text)
        }
    }
}


struct ButtonAppearance: View {
    var text: String
    var background: Color = Color("AccentColor")
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(25)
    }
}

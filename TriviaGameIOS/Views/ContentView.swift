//
//  ContentView.swift
//  TriviaGameIOS
//
//  Created by Frederik Hansen on 17/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            VStack(spacing: 20){
                Text("Welcome to Fred's Pub Quiz")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color("AccentColor"))
                
                Image("PubQuizLogo")
            
            }
            PrimaryButton(text: "Start new quiz")
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .background(.white)
    }
}

#Preview {
    ContentView()
}

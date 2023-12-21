//
//  CompletedQuizView.swift
//  TriviaGameIOS
//
//  Created by Frederik Hansen on 21/12/2023.
//

import SwiftUI

struct CompletedQuizScreen: View {
    @ObservedObject var viewModel: CompletedQuizViewModel
    var body: some View {
        NavigationView {
            VStack(
                spacing: 20
            ){
                Text("You completed Fred's Pub Quiz")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.accentColor)
                
                Text("Correct Answers: \(viewModel.correctAnswers)")
                    .font(.headline)
                    .foregroundColor(.green)
                
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
        .navigationBarBackButtonHidden(true)
    }
    
}

#Preview {
    CompletedQuizScreen(viewModel: CompletedQuizViewModel(correctAnswers: 1))
}


//
//  QuizScreen.swift
//  TriviaGameIOS
//
//  Created by Frederik Hansen on 20/12/2023.
//

import SwiftUI

struct QuizScreen: View {
    @StateObject var viewModel = SelectOptionsViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    QuizScreen()
}

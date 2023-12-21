//
//  CompletedQuizViewModel.swift
//  TriviaGameIOS
//
//  Created by Frederik Hansen on 21/12/2023.
//

import Foundation

class CompletedQuizViewModel: ObservableObject {
    
    @Published var correctAnswers: Int

       init(correctAnswers: Int) {
           self.correctAnswers = correctAnswers
       }
}

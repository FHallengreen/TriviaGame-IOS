//
//  QuizState.swift
//  TriviaGameIOS
//
//  Created by Frederik Hansen on 20/12/2023.
//

import Foundation

enum QuizState {
    case loading
    case quizLoaded([QuizQuestion])
    case answerSelected(isCorrect: Bool, selectedAnswer: String, correctAnswer: String)
    case error(String)
    case completed
    case idle
}

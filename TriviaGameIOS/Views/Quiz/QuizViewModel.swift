//
//  QuizViewModel.swift
//  TriviaGameIOS
//
//  Created by Frederik Hansen on 20/12/2023.
//

import Foundation

class QuizViewModel: ObservableObject {
    @Published var quizState: QuizState = .idle
    private var quizQuestions: [QuizQuestion] = []
    @Published var currentQuestionIndex = 0
    @Published var quizSize = 0

    func setQuizQuestions(_ questions: [QuizQuestion]) {
        self.quizQuestions = questions
        self.currentQuestionIndex = currentQuestionIndex
        self.quizState = .quizLoaded(questions)
        self.quizSize = questions.count
    }

    var currentQuestion: QuizQuestion? {
        guard currentQuestionIndex < quizQuestions.count else { return nil }
        return quizQuestions[currentQuestionIndex]
    }
    
    func moveToNextQuestion() {
        if currentQuestionIndex < quizQuestions.count - 1 {
            currentQuestionIndex += 1
            quizState = .quizLoaded(quizQuestions)
        } else {
            quizState = .completed
        }
    }

    func selectAnswer(_ answer: String) {
        guard let currentQuestion = currentQuestion else { return }

        let isCorrect = answer == currentQuestion.correctAnswer
        quizState = .answerSelected(isCorrect: isCorrect, selectedAnswer: answer, correctAnswer: currentQuestion.correctAnswer)

    }
}

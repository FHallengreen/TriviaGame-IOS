//
//  SelectOptionsViewModel.swift
//  TriviaGameIOS
//
//  Created by Frederik Hansen on 17/12/2023.
//

import Foundation

class SelectOptionsViewModel: ObservableObject {
    
    @Published var selectedCategory: Category = .generalKnowledge
        @Published var selectedNumberOfQuestions: Questions = .five
        @Published var selectedDifficulty: Difficulty = .easy
        @Published var quizQuestions: [QuizQuestion] = []
    @Published var quizState: QuizState = .idle

        private let apiService = QuizApiService()

        func submitQuizRequest() {
           quizState = .loading
            Task {
                do {
                    let response = try await apiService.getQuiz(
                        amount: selectedNumberOfQuestions.rawValue,
                        categoryId: selectedCategory.rawValue,
                        difficulty: selectedDifficulty.rawValue
                    )
                    
                    DispatchQueue.main.async {
                        self.quizQuestions = response.results
                        self.quizState = .quizLoaded(self.quizQuestions)
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.quizState = .error(error.localizedDescription)
                    }
                }
            }
        }
    }



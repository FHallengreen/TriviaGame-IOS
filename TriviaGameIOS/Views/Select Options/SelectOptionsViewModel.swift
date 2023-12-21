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
        @Published var isLoading = false
        @Published var errorMessage: String?

        private let apiService = QuizApiService()

        func submitQuizRequest() {
            isLoading = true
            errorMessage = nil

            Task {
                do {
                    let response = try await apiService.getQuiz(
                        amount: selectedNumberOfQuestions.rawValue,
                        categoryId: selectedCategory.rawValue,
                        difficulty: selectedDifficulty.rawValue
                    )
                    DispatchQueue.main.async {
                        self.quizQuestions = response.results
                        self.isLoading = false
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.errorMessage = error.localizedDescription
                        self.isLoading = false
                    }
                }
            }
        }
    }



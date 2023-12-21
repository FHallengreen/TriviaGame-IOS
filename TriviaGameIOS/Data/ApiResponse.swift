//
//  ApiResponse.swift
//  TriviaGameIOS
//
//  Created by Frederik Hansen on 17/12/2023.
//

import Foundation

struct ApiResponse: Decodable {
    var results: [Quiz.Result]
}

struct Quiz {
    struct Result: Decodable, Identifiable {
        var id: UUID {
            UUID()
        }
        var category: String
        var type: String
        var difficulty: String
        var question: String
        var correctAnswer: String
        var incorrectAnswers: [String]
        
        var formattedQuestion: AttributedString {
            do {
                return try AttributedString(markdown: question)
            } catch {
                print("Error in setting the formatted question: \(error)")
                return ""
            }
        }
        
        var answers: [Answer] {
            do {
                let correct = [Answer(text: try AttributedString(markdown: correctAnswer), isCorrect: true)]
                let incorrects = try incorrectAnswers.map { answer in
                    Answer(text: try AttributedString(markdown: answer), isCorrect: false)
                }
                
                let allAnswers = correct + incorrects
                
                return allAnswers.shuffled()
            } catch {
                print("Error setting answers: \(error)")
                return []
            }
        }
    }
}


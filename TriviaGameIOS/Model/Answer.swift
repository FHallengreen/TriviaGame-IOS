//
//  Answer.swift
//  TriviaGameIOS
//
//  Created by Frederik Hansen on 17/12/2023.
//

import Foundation

struct Answer: Decodable, Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
    var shuffledAnswers: [String] = []
}

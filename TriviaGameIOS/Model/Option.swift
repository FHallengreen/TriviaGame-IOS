//
//  Option.swift
//  TriviaGameIOS
//
//  Created by Frederik Hansen on 17/12/2023.
//

import Foundation

enum Category: Int, CaseIterable, Identifiable {
    case generalKnowledge = 9
    case scienceComputers = 18
    case geography = 22
    case animals = 27
    case celebrities = 26

    var id: Int { self.rawValue }

    var displayName: String {
        switch self {
        case .generalKnowledge: return "General Knowledge"
        case .scienceComputers: return "Science: Computers"
        case .geography: return "Geography"
        case .animals: return "Animals"
        case .celebrities: return "Celebrities"
        }
    }
}

enum Questions: Int, CaseIterable, Identifiable {
    case five = 5
    case ten = 10
    case fifteen = 15
    case twenty = 20

    var id: Int { self.rawValue }
}

enum Difficulty: String, CaseIterable, Identifiable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"

    var id: String { self.rawValue }
}

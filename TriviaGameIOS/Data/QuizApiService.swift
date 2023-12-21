//
//  QuizApiService.swift
//  TriviaGameIOS
//
//  Created by Frederik Hansen on 17/12/2023.
//

import Foundation

class QuizApiService{
    
    func getQuiz(amount: Int, categoryId: Int, difficulty: String) async throws -> ApiResponse {
        let baseUrl = "https://opentdb.com/api.php"
        
        guard var components = URLComponents(string: baseUrl) else {
            throw URLError(.badURL)
        }
        
        components.queryItems = [
            URLQueryItem(name: "amount", value: String(amount)),
            URLQueryItem(name: "category", value: String(categoryId)),
            URLQueryItem(name: "difficulty", value: difficulty.lowercased()),
            URLQueryItem(name: "type", value: "multiple")
        ]
        
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let decodedResponse = try JSONDecoder().decode(ApiResponse.self, from: data)
        return decodedResponse
    }
    
}

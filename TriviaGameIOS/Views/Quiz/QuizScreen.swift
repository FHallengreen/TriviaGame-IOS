//
//  QuizScreen.swift
//  TriviaGameIOS
//
//  Created by Frederik Hansen on 20/12/2023.
//

import SwiftUI

struct QuizScreen: View {
    @ObservedObject var viewModel: QuizViewModel
    
    var body: some View {
        VStack {
            switch viewModel.quizState {
            case .loading:
                ProgressView("Loading...")
                
            case .quizLoaded(let questions):
                if let question = viewModel.currentQuestion {
                    quizQuestionView(question, totalQuestions: questions.count)
                }
                
            case .answerSelected(let isCorrect, let selectedAnswer, let correctAnswer):
                answerFeedbackView(isCorrect, selectedAnswer, correctAnswer)
                
            case .completed:
                CompletedQuizScreen(viewModel: CompletedQuizViewModel())
                
            case .error(let message):
                Text("Error: \(message)")
                    .foregroundColor(.red)
                
            default:
                Text("Welcome to the Quiz")
            }
        }
    }
    
    func quizQuestionView(_ question: QuizQuestion, totalQuestions: Int) -> some View {
        VStack {
            Text("Question \(viewModel.currentQuestionIndex + 1) of \(totalQuestions)")
                .font(.headline)
            
            Text(question.question)
                .font(.title2)
                .padding()
            
            ForEach(question.shuffledAnswers, id: \.self) { answer in
                Button(action: {
                    viewModel.selectAnswer(answer)
                }
                ) {
                    Text(answer)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .foregroundColor(.white)
                .background(Color("AccentColor"))
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func answerFeedbackView(_ isCorrect: Bool, _ selectedAnswer: String, _ correctAnswer: String) -> some View {
        VStack {
            Text(isCorrect ? "Correct!" : "Incorrect!")
                .foregroundColor(isCorrect ? .green : .red)
                .font(.title)
            
            if (isCorrect){
                Text("The answer is: \(selectedAnswer)")
            }
            else{
                Text("You answered: \(selectedAnswer)")
                Text("The correct answer is: \(correctAnswer)")
            }
            
            if viewModel.currentQuestionIndex < viewModel.quizSize - 1 {
                Button("Next Question") {
                    viewModel.moveToNextQuestion()
                }
            }
            else {
                Button("Finish Quiz") {
                    viewModel.moveToNextQuestion()
                }
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}



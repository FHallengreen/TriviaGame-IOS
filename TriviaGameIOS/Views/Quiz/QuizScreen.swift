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
        NavigationView {
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
                    CompletedQuizScreen(viewModel: CompletedQuizViewModel(correctAnswers: viewModel.numberOfCorrectAnswers))
                    
                case .error(let message):
                    Text("Error: \(message)")
                        .foregroundColor(.red)
                    
                default:
                    Text("Welcome to the Quiz")
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func quizQuestionView(_ question: QuizQuestion, totalQuestions: Int) -> some View {
        VStack {
            Text("Question \(viewModel.currentQuestionIndex + 1) of \(totalQuestions)")
                .font(.title)
                .foregroundStyle(Color("AccentColor"))
                            
            Text(question.question)
                .font(.title2)
                .padding(15)
            
            
            ForEach(question.shuffledAnswers, id: \.self) { answer in
                Button(action: {
                    viewModel.selectAnswer(answer)
                }
                ) {
                    Text(answer)
                        .frame(maxWidth: .infinity)
                        .padding(8)
                }
                .foregroundColor(.white)
                .background(Color("AccentColor"))
                .cornerRadius(15)
                .padding(10)
            }
        }
    }
    
    func answerFeedbackView(_ isCorrect: Bool, _ selectedAnswer: String, _ correctAnswer: String) -> some View {
        VStack {
            Text(isCorrect ? "Correct!" : "Incorrect!")
                .foregroundColor(isCorrect ? .green : .red)
                .font(.title)
                .padding(20)
            
            if (isCorrect){
                Text("The answer is: \(selectedAnswer)").font(.title2)
            }
            else{
                Text("You answered: \(selectedAnswer)\nThe correct answer is: \(correctAnswer)")
                    .font(.title2)
                    .multilineTextAlignment(.center)
            }
            if viewModel.currentQuestionIndex < viewModel.quizSize - 1 {
                PrimaryButton(text: "Next Question", action: {
                    viewModel.moveToNextQuestion()
                }).padding(.top,50)
            }
            else {
                NavigationButton(text: "Finish Quiz", destination: CompletedQuizScreen(viewModel: CompletedQuizViewModel(correctAnswers: viewModel.numberOfCorrectAnswers))).padding(.top,50)
                }
        }
        .padding(20)
    }
}

#Preview {
    QuizScreen(viewModel: QuizViewModel())
}

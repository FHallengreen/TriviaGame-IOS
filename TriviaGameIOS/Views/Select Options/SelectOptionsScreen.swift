//
//  SelectOptionsView.swift
//  TriviaGameIOS
//
//  Created by Frederik Hansen on 17/12/2023.
//

import SwiftUI

struct SelectOptionsView: View {
    @StateObject private var viewModel = SelectOptionsViewModel()
    @StateObject private var quizViewModel = QuizViewModel()
    
    var body: some View {
        
        
        switch viewModel.quizState {
        case .loading:
            ProgressView("Loading...")
            
        case .quizLoaded(let questions):
                        QuizScreen(viewModel: quizViewModel)
                            .onAppear {
                                quizViewModel.setQuizQuestions(questions)
                            }
            
        case .error(let message):
            Text("Error: \(message)")
                .foregroundColor(.red)
        default:
            quizOptionsForm
        }
        
    }
    
    var quizOptionsForm: some View {
        VStack{
            ZStack {
                Form {
                    Section(header: Text("Category")) {
                        Picker("Select Category:", selection: $viewModel.selectedCategory) {
                            ForEach(Category.allCases, id: \.self) { category in
                                Text(category.displayName).tag(category)
                            }
                        }
                    }
                    .foregroundColor(Color("AccentColor"))
                    .font(.headline)
                    
                    Section(header: Text("Number of Questions")) {
                        Picker("Select Number of Questions:", selection: $viewModel.selectedNumberOfQuestions) {
                            ForEach(Questions.allCases, id: \.self) { questions in
                                Text("\(questions.rawValue)").tag(questions)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                    } .foregroundColor(Color("AccentColor"))
                        .font(.headline)
                    
                    Section(header: Text("Difficulty")) {
                        Picker("Select Difficulty", selection: $viewModel.selectedDifficulty) {
                            ForEach(Difficulty.allCases, id: \.self) { difficulty in
                                Text(difficulty.rawValue).tag(difficulty)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                    }
                    .foregroundColor(Color("AccentColor"))
                    .font(.headline)
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
                .background(
                    .white
                )
                .navigationBarTitle("Select Options", displayMode: .inline)
            }
            Button("Submit") {
                viewModel.submitQuizRequest()
            }.font(.title2)
        }
    }
}



#Preview {
    SelectOptionsView()
}

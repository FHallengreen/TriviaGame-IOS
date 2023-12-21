//
//  SelectOptionsView.swift
//  TriviaGameIOS
//
//  Created by Frederik Hansen on 17/12/2023.
//

import SwiftUI

struct SelectOptionsScreen: View {
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
            Form {
                SectionView(title: "Category", content: {
                    Picker("Select Category:", selection: $viewModel.selectedCategory) {
                        ForEach(Category.allCases, id: \.self) { category in
                            Text(category.displayName).tag(category)
                        }
                    }
                })
                
                SectionView(title: "Number of Questions", content: {
                    Picker("Select Number of Questions:", selection: $viewModel.selectedNumberOfQuestions) {
                        ForEach(Questions.allCases, id: \.self) { questions in
                            Text("\(questions.rawValue)").tag(questions)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                })
                
                SectionView(title: "Difficulty", content: {
                    Picker("Select Difficulty", selection: $viewModel.selectedDifficulty) {
                        ForEach(Difficulty.allCases, id: \.self) { difficulty in
                            Text(difficulty.rawValue).tag(difficulty)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                })
            }
            PrimaryButton(text: "Submit", action: {
                viewModel.submitQuizRequest()
            })
            .padding(.top, 20)
            

        }
        .background(Color(.systemGroupedBackground))
        .navigationBarTitle("Select Options", displayMode: .inline)
    }
    
}



struct SectionView<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .foregroundColor(Color("AccentColor"))
            content
        }
        .padding(.vertical)

    }
    
}


#Preview {
    SelectOptionsScreen()
}

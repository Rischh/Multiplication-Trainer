//
//  ContentView.swift
//  MultiplicationTrainer
//
//  Created by Samuel Rischebourg on 18/07/2025.
//

import SwiftUI

struct QuestionItem: Identifiable {
    let id = UUID()
    let text: String
    let anwser: Int
}

@Observable
class Questions {
    var items = [QuestionItem]()
}

struct ContentView: View {
    @State private var selectedTable = 2
    @State private var selectedQuestionCount = 5
    @State private var questions = Questions()
    
    @State private var showingSheet = false
    
    let questionCount = [5, 10, 20]
    
    var body: some View {
        NavigationStack {
            Divider()
            
            ZStack {
                Image("Blue Squared Sheet").resizable()
                
                VStack {
                    Spacer()
                    
                    VStack {
                        Stepper("Table of : \(selectedTable)", value: $selectedTable, in: 2...12)
                        
                        Picker("Question count", selection: $selectedQuestionCount) {
                            ForEach(questionCount, id: \.self) { number in
                                Text("\(number)")
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    .padding()
                    
                    Spacer()
                    
                    

                }
                .navigationTitle("Multiplication Trainer")
            }
            Divider()
            
            Button("Start the game") {
                generateQuestions(selectedTable, selectedQuestionCount)
                showingSheet = true
            }
            .sheet(isPresented: $showingSheet) {
                TestView(questions: questions)
            }
        }
    }
    
    func generateQuestions(_ table: Int, _ questionCount: Int) {
        for _ in 0..<questionCount {
            let randomNumber = Int.random(in: 2...10) // à faire: Générer un nombre aléatoire qui n'est pas déja apparu
            
            let question = QuestionItem(text: "\(table) * \(randomNumber)", anwser: table * randomNumber)
            questions.items.append(question)
        }
    }
}

#Preview {
    ContentView()
}

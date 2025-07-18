//
//  ContentView.swift
//  MultiplicationTrainer
//
//  Created by Samuel Rischebourg on 18/07/2025.
//

import SwiftUI

struct Question {
    let text: String
    let anwser: Int
}

struct ContentView: View {
    @State private var selectedTable = 2
    @State private var selectedQuestionCount = 5
    @State private var questions = [Question]()
    
    let questionCount = [5, 10, 20]
    
    var body: some View {
        Stepper("Table of : \(selectedTable)", value: $selectedTable, in: 2...12)
        
        Picker("Question count", selection: $selectedQuestionCount) {
            ForEach(questionCount, id: \.self) { number in
               Text("\(number)")
            }
        }
        .pickerStyle(.segmented)
        
        Button("Start the game") {
            generateQuestions(selectedTable, selectedQuestionCount)
            // ouvre la nouvelle Page/Vue
        }
    }
    
    func generateQuestions(_ table: Int, _ questionCount: Int) {
        for _ in 0..<questionCount {
            let randomNumber = Int.random(in: 2...10) // à faire: Générer un nombre aléatoire qui n'est pas déja apparu
            let question = Question(text: "\(table) * \(randomNumber)", anwser: table * randomNumber)
            
            questions.append(question)
        }
        
        print(questions)
    }
}

#Preview {
    ContentView()
}

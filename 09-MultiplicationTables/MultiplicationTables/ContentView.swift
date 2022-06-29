//
//  ContentView.swift
//  MultiplicationTables
//
//  Created by Landon Cayia on 6/29/22.
//

import SwiftUI

struct ContentView: View {
    // This will be false while the setting selection screen is displayed
    @State private var gameIsActive = false
    
    @State private var tablesUpTo = 5
    @State private var questionsToAsk = 10
    
    @State private var currentGameQuestion = 1
    @State private var currentGameTableOptions = [2, 3, 4, 5]
    @State private var currentGameAnswer = 0
    
    @FocusState private var inputIsFocused: Bool
    
    let tableOptionRange = 2...12
    let questionOptions = 5...20
    
    var body: some View {
        if gameIsActive == false {
            // Ask for settings choices
            NavigationView {
                Form {
                    Section {
                        Text("Difficulty")
                            .font(.headline)
                        
                        Stepper("Max table number: \(tablesUpTo)", value: $tablesUpTo, in: tableOptionRange, step: 1)
                    }
                    
                    Section {
                        Text("Questions")
                            .font(.headline)
                        
                        Stepper("\(questionsToAsk) questions", value: $questionsToAsk, in: questionOptions, step: 5)
                    }
                    
                    Button("Start Game!") {
                        initializeGame()
                        gameIsActive = true
                    }
                        .font(.headline)
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.cyan, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        
                }
                .navigationTitle("MultiplicationTables")
            }
        } else {
            // Game is actively being played
            NavigationView {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [.red, .yellow, .blue]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                    
                    VStack {
                        Text("Question \(currentGameQuestion) of \(questionsToAsk)")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("What is \(currentGameTableOptions[0]) times \(currentGameTableOptions[1])?")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        Spacer()
                        
                        TextField("Enter your answer", value: $currentGameAnswer, format: .number)
                            .padding(50)
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .keyboardType(.decimalPad)
                            .focused($inputIsFocused)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(50)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            
                            Button("Done") {
                                inputIsFocused = false
                            }
                        }
                    }
                }
            }
        }
    }
    
    func initializeGame() {
        currentGameTableOptions = Array(2...tablesUpTo)
        currentGameTableOptions.shuffle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

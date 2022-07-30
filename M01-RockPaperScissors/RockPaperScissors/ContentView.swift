//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Landon Cayia on 6/18/22.
//

import SwiftUI

//struct MoveButton: View {
//    var move: String
//    var action: (String) -> Void
//
//    var body: some View {
//        Button {
//            action
//        }
//            .font(.system(size: 200))
//            .background(.black)
//    }
//}

//struct GameText: View {
//    var text: String
//
//    var body: some View {
//        Text(text)
//            .font(.title)
//            .foregroundColor(.blue)
//    }
//}

struct ContentView: View {
    let moves = ["Rock", "Paper", "Scissors"]
    let moveEmojis = ["🪨", "📄", "✂️"]
    
    @State private var cpuChoice = "Rock"
    @State private var shouldWin = Bool.random()
    @State private var playerScore = 0
    @State private var numberOfTurns = 1
    @State private var showingGameOver = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.orange, .orange, .white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Turn \(numberOfTurns) of 10")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                Text("Your score: \(playerScore)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                
                Spacer()
                
                VStack(spacing: 50) {
                    Text("CPU move: \(cpuChoice)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.secondary)
                    
                    if shouldWin {
                        Text("Your goal is to win.")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.secondary)
                    } else {
                        Text("You goal is to lose.")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.secondary)
                    }
                    
                    HStack {
                        ForEach(0..<3) { number in
                            Button(moveEmojis[number], action: {moveSelected(moves[number]) })
                                .font(.system(size: 75))
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(20)
                .background(.thickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
            }
            .padding()
        }
        .alert("Game Over", isPresented: $showingGameOver) {
            Button("New Game", action: reset)
        } message: {
            Text("Your final score is \(playerScore)")
        }
    }
    
    func newTurn() {
        if numberOfTurns == 10 {
            showingGameOver = true
        } else {
            numberOfTurns += 1
            cpuChoice = moves[Int.random(in: 0..<3)]
            shouldWin.toggle()
        }
    }
    
    func moveSelected(_ playerChoice: String) {
        if playerChoice == "Rock" {
            if shouldWin == true && cpuChoice == "Scissors" {
                playerScore += 1
            } else if shouldWin == false && cpuChoice == "Paper" {
                playerScore += 1
            }
        } else if playerChoice == "Paper" {
            if shouldWin == true && cpuChoice == "Rock" {
                playerScore += 1
            } else if shouldWin == false && cpuChoice == "Scissors" {
                playerScore += 1
            }
        } else {
            if shouldWin == true && cpuChoice == "Paper" {
                playerScore += 1
            } else if shouldWin == false && cpuChoice == "Rock" {
                playerScore += 1
            }
        }
        
        newTurn()
    }
    
    func reset() {
        playerScore = 0
        numberOfTurns = 0
        newTurn()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

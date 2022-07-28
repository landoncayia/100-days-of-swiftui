//
//  ContentView.swift
//  HabitTracker
//
//  Created by Landon Cayia on 7/28/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habitList = HabitList()
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habitList.habits) { habit in
                    NavigationLink {
                        HabitDetailView(habit: habit)
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(habit.title)
                                    .font(.headline)
                                Text(habit.description)
                                    .font(.caption)
                            }
                            
                            Spacer()
                            
                            Text(habit.numCompletions, format: .number)
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        addSampleHabits()
                    } label: {
                        Text("Samples")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddHabit = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddHabitView(habitList: habitList)
            }
        }
    }
    
    func addSampleHabits() {
        let sampleHabit1 = Habit(title: "Go for a walk", description: "At least 10 minutes should do.", numCompletions: 10)
        let sampleHabit2 = Habit(title: "Take vitamins", description: "Be sure to get them all!", numCompletions: 5)
        let sampleHabit3 = Habit(title: "Read Bible", description: "Your relationship with God is important!", numCompletions: 368)
        habitList.habits.append(sampleHabit1)
        habitList.habits.append(sampleHabit2)
        habitList.habits.append(sampleHabit3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

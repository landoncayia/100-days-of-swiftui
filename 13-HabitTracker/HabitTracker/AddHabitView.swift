//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Landon Cayia on 7/28/22.
//

import SwiftUI

struct AddHabitView: View {
    @ObservedObject var habitList: HabitList
    
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var description = ""
    @State private var numCompletions = 0
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                
                TextField("Description", text: $description)
                
                TextField("Times completed", value: $numCompletions, format: .number)
                    .keyboardType(.numberPad)
            }
            .navigationTitle("Add new habit")
            .toolbar {
                Button("Save") {
                    let habit = Habit(title: title, description: description, numCompletions: numCompletions)
                    habitList.habits.append(habit)
                    dismiss()
                }
            }
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habitList: HabitList())
    }
}

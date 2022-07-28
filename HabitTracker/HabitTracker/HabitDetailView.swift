//
//  HabitDetailView.swift
//  HabitTracker
//
//  Created by Landon Cayia on 7/28/22.
//

import SwiftUI

struct HabitDetailView: View {
    let habit: Habit
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HabitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetailView(habit: Habit(title: "Habit", description: "Habit description", numCompletions: 5))
    }
}

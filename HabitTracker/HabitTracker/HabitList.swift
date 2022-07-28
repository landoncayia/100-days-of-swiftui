//
//  HabitList.swift
//  HabitTracker
//
//  Created by Landon Cayia on 7/28/22.
//

import Foundation

class HabitList: ObservableObject {
    @Published var habits = [Habit]()
    
    init() {
        // Data storing/loading to come here
        
        habits = []
    }
}

//
//  Habit.swift
//  HabitTracker
//
//  Created by Landon Cayia on 7/28/22.
//

import Foundation
import SwiftUI

struct Habit: Identifiable {
    var id = UUID()
    let title: String
    let description: String
    
    var numCompletions: Int
    
    var titleStyle: Color {
        switch numCompletions {
        case ..<7:
            return .red
        case 7..<14:
            return .orange
        case 14..<21:
            return .yellow
        case 21..<30:
            return .green
        case 30..<365:
            return .blue
        case 365...:
            return .indigo
        default:
            // Should never happen
            return .cyan
        }
    }
}

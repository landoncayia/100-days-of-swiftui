//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Landon Cayia on 6/16/22.
//

import SwiftUI

struct BlueTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func blueTitleStyle() -> some View {
        modifier(BlueTitleStyle())
    }
}

struct ContentView: View {
    var body: some View {
        Text("This is a blue title.")
            .blueTitleStyle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

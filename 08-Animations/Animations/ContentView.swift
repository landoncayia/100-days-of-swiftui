//
//  ContentView.swift
//  Animations
//
//  Created by Landon Cayia on 6/25/22.
//

import SwiftUI

struct AnimationView {
    let id = UUID()
    var name: String
    var view: AnyView
    
    init<V>(_ name: String, view: V) where V: View {
        self.name = name
        self.view = AnyView(view)
    }
}

struct ContentView: View {
    private let animations: [AnimationView] = [
        AnimationView("Implicit animations", view: ImplicitAnimationsView()),
        AnimationView("Customizing animations", view: CustomizingAnimationsView()),
        AnimationView("Animating bindings", view: AnimatingBindingsView()),
        AnimationView("Explicit animations", view: ExplicitAnimationsView()),
        AnimationView("Controlling the animation stack", view: ControllingAnimationStackView()),
        AnimationView("Animating gestures", view: AnimatingGesturesView()),
        AnimationView("Showing and hiding views with transitions", view: TransitionsView()),
        AnimationView("Building custom transitions using ViewModifier", view: ViewModifierView())
    ]
    
    var body: some View {
        NavigationView {
            List(animations, id: \.id) { animation in
                NavigationLink(destination: animation.view) {
                    Text(animation.name)
                }
            }
            .navigationBarTitle("Animations")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

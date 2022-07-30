//
//  ImplicitAnimationsView.swift
//  Animations
//
//  Created by Landon Cayia on 7/9/22.
//

import SwiftUI

struct ImplicitAnimationsView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.default, value: animationAmount)
    }
}

struct ImplicitAnimations_Previews: PreviewProvider {
    static var previews: some View {
        ImplicitAnimationsView()
    }
}

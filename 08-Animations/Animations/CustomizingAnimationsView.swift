//
//  CustomizingAnimationsView.swift
//  Animations
//
//  Created by Landon Cayia on 7/9/22.
//

import SwiftUI

struct CustomizingAnimationsView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {

        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                        .repeatForever(autoreverses: false),
                    value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 2
        }
    }
}

struct CustomizingAnimationsView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizingAnimationsView()
    }
}

//
//  MultiplyBlendModeView.swift
//  Drawing
//
//  Created by Landon Cayia on 7/26/22.
//

import SwiftUI

struct MultiplyBlendModeView: View {
    var body: some View {
        ZStack {
            // Evil bunny
            Image("bunny")
                .resizable()
                .scaledToFit()
            
            Rectangle()
                .fill(.red)
                // Multiplies pixels together to get result
                .blendMode(.multiply)
        }
    }
}

struct MultiplyBlendModeView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplyBlendModeView()
    }
}

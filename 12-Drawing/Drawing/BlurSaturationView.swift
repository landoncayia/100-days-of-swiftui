//
//  BlurSaturationView.swift
//  Drawing
//
//  Created by Landon Cayia on 7/26/22.
//

import SwiftUI

struct BlurSaturationView: View {
    @State private var amount = 0.0
    
    var body: some View {
        VStack {
            Image("bunny")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(amount)
                .blur(radius: (1 - amount) * 20)
            
            Slider(value: $amount)
                .padding()
        }
    }
}

struct BlurSaturationView_Previews: PreviewProvider {
    static var previews: some View {
        BlurSaturationView()
    }
}

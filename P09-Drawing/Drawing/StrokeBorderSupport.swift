//
//  StrokeBorderSupport.swift
//  Drawing
//
//  Created by Landon Cayia on 7/9/22.
//

import SwiftUI

struct StrokeBorderSupport: View {
    var body: some View {
        /// Uses `Arc` struct from `ShapeView`; was modified for stroke border support
        Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
            .strokeBorder(.blue, lineWidth: 40)
    }
}

struct StrokeBorderSupport_Previews: PreviewProvider {
    static var previews: some View {
        StrokeBorderSupport()
    }
}

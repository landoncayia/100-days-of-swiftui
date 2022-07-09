//
//  BlueTriangleView.swift
//  Drawing
//
//  Created by Landon Cayia on 7/9/22.
//

import SwiftUI

/// The main difference between paths and shapes is that shapes are intended to be reused, while paths are meant for a single use.

struct PathView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
//            path.closeSubpath()
        }
        .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//        .fill(.blue)
//        .stroke(.blue, lineWidth: 10)
    }
}

struct BlueTriangleView_Previews: PreviewProvider {
    static var previews: some View {
        PathView()
    }
}

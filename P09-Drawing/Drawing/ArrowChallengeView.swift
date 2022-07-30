//
//  ArrowChallengeView.swift
//  Drawing
//
//  Created by Landon Cayia on 7/27/22.
//

import SwiftUI

struct Arrow: Shape {
    var lineThickness: Double
    
    var animatableData: Double {
        get { lineThickness }
        set { lineThickness = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY - rect.height / 8))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX - rect.width / 7, y: rect.minY + rect.height / 8))
        path.addLine(to: CGPoint(x: rect.midX + rect.width / 7, y: rect.minY + rect.height / 8))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct ArrowTriangleFill: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX - rect.width / 7, y: rect.minY + rect.height / 8))
        path.addLine(to: CGPoint(x: rect.midX + rect.width / 7, y: rect.minY + rect.height / 8))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct ArrowChallengeView: View {
    @State private var lineThickness = 20.0
    
    var body: some View {
        VStack {
            ZStack {
                ArrowTriangleFill()
                    .fill(.blue)
                
                Arrow(lineThickness: lineThickness)
                    .stroke(.blue, style: StrokeStyle(lineWidth: lineThickness, lineCap: .round, lineJoin: .round))
            }
            .onTapGesture {
                withAnimation {
                    lineThickness = Double.random(in: 1...90)
                }
            }
        }
    }
}

struct ArrowChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ArrowChallengeView()
    }
}

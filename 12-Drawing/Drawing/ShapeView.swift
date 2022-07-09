//
//  ShapeView.swift
//  Drawing
//
//  Created by Landon Cayia on 7/9/22.
//

import SwiftUI

/// The main difference between paths and shapes is that shapes are intended to be reused, while paths are meant for a single use.

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

/// Before stroke border support, was just `Shape`
struct Arc: InsettableShape {
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    /// Stroke border support
    var insetAmount = 0.0
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStartAngle = startAngle - rotationAdjustment
        let modifiedEndAngle = endAngle - rotationAdjustment
        
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStartAngle, endAngle: modifiedEndAngle, clockwise: !clockwise)
        
        return path
    }
    
    /// Stroke border support
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct ShapeView: View {
    var body: some View {
        ZStack {
            Triangle()
                .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: 300, height: 300)
    //            .fill(.red)
            
            Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
                .stroke(.blue, lineWidth: 10)
                .frame(width: 300, height: 300)
                .offset(x: 0, y: -200)
        }
    }
}

struct ShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeView()
    }
}

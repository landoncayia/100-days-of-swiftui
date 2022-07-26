//
//  ContentView.swift
//  Drawing
//
//  Created by Landon Cayia on 7/9/22.
//

import SwiftUI

struct DrawingView {
    let id = UUID()
    var name: String
    var view: AnyView
    
    init<V>(_ name: String, view: V) where V: View {
        self.name = name
        self.view = AnyView(view)
    }
}

struct ContentView: View {
    private let drawings: [DrawingView] = [
        DrawingView("Paths", view: PathView()),
        DrawingView("Shapes", view: ShapeView()),
        DrawingView("Stroke border support", view: StrokeBorderSupport()),
        DrawingView("CGAffineTransform (flower)", view: CGAffineTransformView()),
        DrawingView("ImagePaint", view: ImagePaintView()),
        DrawingView("Drawing groups", view: DrawingGroupView()),
        DrawingView("Special effect: Multiply blend mode", view: MultiplyBlendModeView()),
        DrawingView("Special effect: Color circles", view: ColorCircleView()),
        DrawingView("Special effect: Blur and saturation", view: BlurSaturationView()),
        DrawingView("Animating shapes", view: AnimatingShapesView()),
        DrawingView("Animating complex shapes", view: AnimatingComplexShapesView()),
        DrawingView("Spirograph", view: SpirographView())
    ]
    
    var body: some View {
        NavigationView {
            List(drawings, id: \.id) { drawing in
                NavigationLink(destination: drawing.view) {
                    Text(drawing.name)
                }
            }
            .navigationBarTitle("Drawings")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

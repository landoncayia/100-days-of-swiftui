//
//  ImagePaintView.swift
//  Drawing
//
//  Created by Landon Cayia on 7/25/22.
//

import SwiftUI

struct ImagePaintView: View {
    var body: some View {
        Capsule()
            .strokeBorder(ImagePaint(image: Image("bunny"), sourceRect: CGRect(x: 0, y: 0.5, width: 1, height: 0.5), scale: 0.1), lineWidth: 100)
            .frame(width: 300, height: 500)
    }
}

struct ImageShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePaintView()
    }
}

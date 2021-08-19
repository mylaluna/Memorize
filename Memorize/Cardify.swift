//
//  Cardify.swift
//  Memorize
//
//  Created by Elune on 15/8/21.
//  This is a implementation of view modifier

import SwiftUI

struct Cardify: AnimatableModifier {
    
    var rotation: Double // in degrees
    
    // tell AnimatableModifier what data do you want to animate
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            if rotation < 90 {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
            } else {
                shape.fill()
            }
            // need to keep the card content as the implicit view modifier animation
            // only works on existing things
            content.opacity(rotation < 90 ? 1 : 0)
        }
        .rotation3DEffect(
            Angle.degrees(rotation),
            axis: (0, 1, 0)
        )
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}

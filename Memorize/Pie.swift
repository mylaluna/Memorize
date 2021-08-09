//
//  Pie.swift
//  Memorize
//
//  Created by Elune on 8/8/21.
//
// create a customised pie shape
import SwiftUI

struct Pie: Shape {
    
    var startAngle: Angle
    var endAngle: Angle
    var closkWise: Bool = false
    
    // parameter rect is the space for us to draw
    func path(in rect: CGRect) -> Path {
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * CGFloat(cos(startAngle.radians)),
            y: center.y + radius * CGFloat(sin(startAngle.radians))
        )
        var p = Path()
        p.move(to: center) // go to the center
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: !closkWise // the coordinate system is upside down
        )
        p.addLine(to: center)
        return p
    }
}

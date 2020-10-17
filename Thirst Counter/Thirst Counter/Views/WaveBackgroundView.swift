//
//  WaveBackgroundView.swift
//  Thirst Counter
//
//  Created by Jordan Lee on 8/2/20.
//  Copyright © 2020 Jordan Lee. All rights reserved.
//

import SwiftUI
import Combine
private var repeatingAnimation: Animation {
    Animation
        .easeInOut
        .speed(100)
        .repeatForever()
}
struct Wave: Shape {
    let graphWidth: CGFloat
    let amplitude: CGFloat
    
    func path(in rect: CGRect) -> Path {
            let width = rect.width
            let height = rect.height

            let origin = CGPoint(x: 0, y: height * 0.50)

            var path = Path()
            path.move(to: origin)

            var endY: CGFloat = 0.0
            let step = 5.0
            for angle in stride(from: step, through: Double(width) * (step * step), by: step) {
                let x = origin.x + CGFloat(angle/360.0) * width * graphWidth
                let y = origin.y - CGFloat(sin(angle/180.0 * Double.pi)) * height * amplitude
                path.addLine(to: CGPoint(x: x, y: y))
                endY = y
            }
            path.addLine(to: CGPoint(x: width, y: endY))
            path.addLine(to: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: 0, y: height))
            path.addLine(to: CGPoint(x: 0, y: origin.y))
           
            return path
    }
}

struct WaveBackgroundView: View {
    var waveBackground1 = Wave(graphWidth: 1, amplitude: 0.05)
    var waveBackground2 = Wave(graphWidth: 1, amplitude: 0.05)
    
    var body: some View {
        VStack {
            ZStack {
                waveBackground1
                    .offset(x: 0, y: 20)
                waveBackground2
                    .offset(x: 0, y: 20)
            }
        }
    }
}

struct WaveBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        WaveBackgroundView().animation(repeatingAnimation)
    }
}

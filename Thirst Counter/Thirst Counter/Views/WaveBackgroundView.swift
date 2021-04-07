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
        .speed(1000)
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
    
    @State var sizeChange = 1
    
    @Namespace private var animation
    
    var waveBackground1 = Wave(graphWidth: 1, amplitude: 0.05)

    var waveBackground2 = Wave(graphWidth: 1, amplitude: 0.05)
    
    var body: some View {
        
        VStack {
            ZStack {
                HStack {
                    Button(action: {
                        if 0 < sizeChange {
                            if sizeChange < 7 {
                                sizeChange-=2
                            }
                        }
                    }){
                        Text("Increase!")
                    }
                    
                    Button(action: {
                        if 0 < sizeChange {
                            if sizeChange < 7 {
                                sizeChange+=2
                            }
                        }
                    }){
                        Text("Decrease!")
                    }
                }
                waveBackground1
                    .offset(x: 0, y: CGFloat(40*sizeChange))
                    .opacity(0.2)
                    
                    .matchedGeometryEffect(id: "wave", in: animation)
                    .animation(.easeIn)
                
                
                waveBackground2
                    .offset(x: 0, y: CGFloat(60*sizeChange))
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    
                    .matchedGeometryEffect(id: "wave", in: animation)
                    .animation(.easeIn)
            }
        }
    }
}

struct WaveBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        WaveBackgroundView()
    }
}

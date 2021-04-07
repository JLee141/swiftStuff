//
//  EasterEggCelebration.swift
//  Thirst Counter
//
//  Created by Jordan Lee on 4/2/21.
//  Copyright © 2021 Jordan Lee. All rights reserved.
//

import SwiftUI
import ConfettiView

struct EasterEggCelebration: View {
    @State var timeRemaining = 6
    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    let confettiView = ConfettiView(confetti: [
        .text("😝😝😝")
    ])
    
    var body: some View {
            ZStack {
                if timeRemaining > 0 {
                    confettiView
                }
            }.onReceive(timer) { _ in
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                }
            }
            .animation(.easeIn(duration: 2))
            .animation(.easeOut(duration: 1))
            
            .opacity(0.5)
            //.animation(.easeIn)
            //.transition(.opacity)
        }
}

struct EasterEggCelebration_Previews: PreviewProvider {
    static var previews: some View {
        EasterEggCelebration()
    }
}

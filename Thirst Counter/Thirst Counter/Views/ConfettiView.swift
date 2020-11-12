//
//  ConfettiView.swift
//  Thirst Counter
//
//  Created by Jordan Lee on 10/20/20.
//  Copyright © 2020 Jordan Lee. All rights reserved.
//

import SwiftUI
import ConfettiView

struct ContentView: View {

    let confettiView = ConfettiView( confetti: [
                .text("🎉"),
                .text("💪"),
                .shape(.circle),
                .shape(.triangle),
            ])

    var body: some View {
        confettiView
    }
}
struct ConfettiView_Previews: PreviewProvider {
    static var previews: some View {
        ConfettiView()
    }
}

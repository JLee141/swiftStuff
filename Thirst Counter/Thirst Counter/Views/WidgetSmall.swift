//
//  WidgetSmall.swift
//  Thirst Counter
//
//  Created by Jordan Lee on 1/4/21.
//  Copyright © 2021 Jordan Lee. All rights reserved.
//

import SwiftUI

struct WidgetSmall: View {
    //10 seconds countdown
    @State private var timeRemaining = 10
    @State private var isActive = true
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @EnvironmentObject var userWater: Liquid
    var body: some View {
        
        VStack {
            Text("The time remaining is: \(timeRemaining)")
            
        }.onReceive(timer) { _ in
            if self.timeRemaining > 0 {
                timeRemaining-=1
            }
        }
    }
}

struct WidgetSmall_Previews: PreviewProvider {
    static var previews: some View {
        WidgetSmall()
    }
}

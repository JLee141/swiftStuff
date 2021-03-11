//
//  LiquidChooseView.swift
//  Thirst Counter
//
//  Created by Jordan Lee on 3/10/21.
//  Copyright © 2021 Jordan Lee. All rights reserved.
//

import SwiftUI

struct LiquidChooseView: View {
    @EnvironmentObject var userWater: Liquid
    
    let textList = ["This", "is", "A", "test", "list"]
    
    @State var liquidList = ["Water","Coffee"]
    @State var displayNumber = 0
    var wordSelect = ""
    @State var button = false
    @State var activateView = false
    @State var waterGoalBindingVariable:Int = 0
    @State var waterDailyBindingVariable:Int = 0
    
    var body: some View {
        VStack {
            Text("Liquids")
                .font(.title)
            Spacer()
            Text("WaterGoal: \(waterGoalBindingVariable)").font(.title)
            Text("DailyWater: \(waterDailyBindingVariable)").font(.title)
            Spacer()
            HStack {
//                ForEach(0..<2) { _ in
//                    Button(action: {
//                        activateView.toggle()
//                    }){
//                        RoundedRectangle(cornerRadius: 40)
//                            .size(width: 140, height: 140)
//                            .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
//                            .padding()
//                    }
//                }
            }
}
    }
}

struct LiquidChooseView_Previews: PreviewProvider {
    static var previews: some View {
        LiquidChooseView(waterGoalBindingVariable: 102,waterDailyBindingVariable: 0 )
            
    }
}

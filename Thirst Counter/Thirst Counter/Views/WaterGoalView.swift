//
//  WaterGoalView.swift
//  Thirst Counter
//
//  Created by Jordan Lee on 9/30/20.
//  Copyright © 2020 Jordan Lee. All rights reserved.
//

import SwiftUI
class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}
struct WaterGoalView: View {
    @EnvironmentObject var userWater: Liquid
    @State var waterGoalBinding:Int
    @State var someText = ""
    @State var show = false
    @State var numberBindingText = ""
    
    var body: some View {
        
        VStack {

            Spacer()
            VStack {
                
                Text("How much water would you like to drink today? 💧")
                    .font(.title)
                
            }
            TextField("Number of OZ, currently \(userWater.waterGoal)", text: $numberBindingText, onCommit: {
                
            }).keyboardType(.numberPad)
            .padding()
            Spacer()
            Button(action: {
                //userWater.recordWaterGoal(waterGoalRecord: waterGoalBinding)
                
            }) {
                   Text("Confirm")
                }
            }
        
        }
    
    }


struct WaterGoalView_Previews: PreviewProvider {
    static var previews: some View {
        WaterGoalView(waterGoalBinding: 102)
    }
}

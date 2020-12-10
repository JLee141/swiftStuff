//
//  WaterGoalView.swift
//  Thirst Counter
//
//  Created by Jordan Lee on 9/30/20.
//  Copyright © 2020 Jordan Lee. All rights reserved.
//

import SwiftUI

//This is for the
class NumbersOnly: ObservableObject {
    @State private var showingAlert = false
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
//        //Logic I will add later for an alert over a certain amount of water that a user inputs.
//        willSet {
//            if (Int(newValue))! > 20000 {
//                self.showingAlert = true
//            }
//        }
    }
}
struct WaterGoalView: View {
    //PresentationMode gets me out of this view when I change it //Used it in the confirm button.
    @Environment(\.presentationMode) var presentationMode
    //@State private var showingAlert = false

    @EnvironmentObject var userWater: Liquid
    @State var waterGoalBinding:Int = 0
    @State var input = NumbersOnly()
    let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
    var body: some View {
        
        VStack {
            Spacer()
            VStack {
                Text("How much water would you like to drink today? 💧")
                    .font(.title)
                    .padding()
            }
            HStack {
                Spacer()
                Text("Number Of OZ:")
                    .italic()
                    .bold()
                    .padding()
                    
                TextField("currently \(waterGoalBinding)", text: $input.value.animation(.easeIn), onCommit: {
                    self.waterGoalBinding = Int(input.value)!
                })
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .padding()
            }
            
            Spacer()
            //Confirms binding for watergoal and dismisses this sheet
            Button(action: {
                if Int(input.value) == nil {
                impactHeavy.impactOccurred()
                self.presentationMode.wrappedValue.dismiss()
                
                } else {
                self.waterGoalBinding = Int(input.value)!
                userWater.recordWaterGoal(waterGoal: self.waterGoalBinding)
                impactHeavy.impactOccurred()
                self.presentationMode.wrappedValue.dismiss()
                
                }
                
            }) {
                   Text("Confirm")
                    .background(Color.blue).foregroundColor(Color.white).cornerRadius(15).padding(.horizontal, 20)
                        .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 5)
                    .font(.title)
                
            }
        }.padding()
        
    }
}

struct WaterGoalView_Previews: PreviewProvider {
    static var previews: some View {
        WaterGoalView(waterGoalBinding: 102)
    }
}

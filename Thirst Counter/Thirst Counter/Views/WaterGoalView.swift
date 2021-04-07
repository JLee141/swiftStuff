//
//  WaterGoalView.swift
//  Thirst Counter
//
//  Created by Jordan Lee on 9/30/20.
//  Copyright © 2020 Jordan Lee. All rights reserved.
//

import SwiftUI

//This is to format numbers so that field only takes an actual numbers, usable throughout the project.
class NumbersOnly: ObservableObject {
    
    @State var showingOver9000Alert = false
    
    @Published var value = "" {
        didSet {
            let filtered = value.filter {
                $0.isNumber
            }
            if value != filtered {
                value = filtered
            }
        }
        //Logic I will add later for an alert over a certain amount of water that a user inputs.
//        willSet {
//            if (Int(newValue))! > 9999 {
//                let zero = "0"
//                let filtered = value.filter { $0.isNumber }
//                if value != filtered {
//                    value = zero
//                }
//            }
//        }
    }
}

struct WaterGoalView: View {
    //PresentationMode gets me out of this view when I change it //Used it in the confirm button.
    @Environment(\.presentationMode) var presentationMode
    //@State private var showingAlert = false

    @EnvironmentObject var userWater: LiquidModel
    @State var waterGoalBinding:Int = 0
    @State var input = NumbersOnly()
    @State var liquidName:String = ""
    
    //Pops alert if value goes over 9999
    @State private var showingAlert = false
    
    let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
        VStack {
            Button(action: {
                impactHeavy.impactOccurred()
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName:"chevron.compact.down")
            }
            
            Spacer()
            VStack {
                Text("How much liquid would you like to drink today?💧")
                    .font(.title)
                    .padding()
            }
            HStack {
                Text("Number Of OZ:")
                    .font(.title3)
                    .italic()
                    .bold()
                    .padding()
                    
                TextField("currently \(waterGoalBinding)", text: $input.value.animation(.easeIn), onCommit: {
                    if Int(input.value) ?? 0 < 9000 {
                        self.waterGoalBinding = Int(input.value)!
                    }
                })
                .font(.title2)
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
                    }
                else if Int(input.value) ?? 0 > 8999 {
                    input.value = "0"
                    self.showingAlert.toggle()
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
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("It's over 9,000! 😭"), message: Text("You set the goal too high! Please set under 9,000"), dismissButton: .default(Text("You got it")))
       }
        
    }
}

struct WaterGoalView_Previews: PreviewProvider {
    static var previews: some View {
        WaterGoalView(waterGoalBinding: 102)
    }
}

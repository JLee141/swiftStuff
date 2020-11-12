//
//  WelcomeScreen.swift
//  Thirst Counter
//
//  Created by Jordan Lee on 10/27/20.
//  Copyright © 2020 Jordan Lee. All rights reserved.
//

import SwiftUI

struct WelcomeScreen: View {
    @State private var input = NumbersOnly()
    @State private var textFieldBinding: String = ""
    @EnvironmentObject var userWater: Liquid
    @State var waterGoalBinding:Int = 0
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Spacer()
        Text("Hello! Welcome to thirst counter!💧")
            .font(.title)
            .padding()
        Text("Let's start with a goal (In oz's)")
            .font(.body)
            .bold()
            HStack {
                Spacer()
                TextField("Goal goes here", text: $input.value)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            Button(action: {
                self.waterGoalBinding = Int(input.value)!
                userWater.recordWaterGoal(waterGoal: self.waterGoalBinding)
                
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Confirm")
                 .background(Color.blue).foregroundColor(Color.white).cornerRadius(15).padding(.horizontal, 20)
                     .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 5)
                 .font(.title)
            })
        }
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
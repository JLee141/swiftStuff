//
//  ContentView.swift
//  Thirst Counter
//
//  Created by Jordan Lee on 7/10/20.
//  Copyright © 2020 Jordan Lee. All rights reserved.
//

import SwiftUI
import Swift

struct MainPage: View {
    @State var userWater = Liquid(Water: UserDefaults.standard.integer(forKey: "water"))
    @State var waterTotal: Int = 0
    @State var lastWaterAdded: Int = 0
    //@ObservedObject var savedStuff = Liquid()

    //These functions control the variable water total which is what is shown
    func addOne() {
        self.waterTotal+=1
    }
    
    func minusOne() {
            self.waterTotal-=1
    }
    
    func addToTotal(water:Int){
        self.waterTotal = water
    }

    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        //Testing out Button Actions in the view
        ZStack {
            //WaveBackgroundView()
            VStack {
                Text("Water Today")
                .bold()
                .underline()
                .bold()
                userWater.dailyWaterDisplay()
                HStack {
                    Button(action: {
                        self.userWater.resetButton()
                    }) {
                        Text("Reset")
                       }
                }
                Spacer()
                Text("\(waterTotal) oz").bold().font(.largeTitle)
                Text("")
                Button(action: {
                    self.addToTotal(water: self.lastWaterAdded)
                }) {
                    Text("Previous / \(lastWaterAdded) oz").font(.body).background(Color.blue).foregroundColor(Color.white).cornerRadius(15).padding(.horizontal, 20)
                }
                Spacer()
                Button(action: {
                    self.userWater.addWaterDaily(waterDisplay: self.waterTotal)
                    if self.waterTotal == 0{
                    }else{
                    self.lastWaterAdded = self.waterTotal
                    }
                    self.waterTotal = 0
                }) {
                    Text("Confirm").font(.largeTitle).background(Color.blue).foregroundColor(Color.white).cornerRadius(15).padding(.horizontal, 20)
                }
                HStack {
                    Button(action: {
                        self.minusOne()
                    }) {
                        Image(systemName: "minus")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .frame(width: 60, height: 60)
                            .cornerRadius(20)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .shadow(color: Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)), radius: 20, x: 20, y: 20)
                    }
                    Spacer()
                    Button(action: {
                        self.addOne()
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .frame(width: 60, height: 60)
                            .cornerRadius(20)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .shadow(color: Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)), radius: 20, x: 20, y: 20)
                        }
                    }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

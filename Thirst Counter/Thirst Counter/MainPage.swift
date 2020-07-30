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
    @State var userWater = Liquid(water: 0)
    @State var waterTotal: Int = 0
    @State var lastWaterAdded: Int = 0

    func addOne() {
        self.waterTotal+=1
    }
    
    func minusOne(){
        self.waterTotal-=1
    }

     @Environment(\.presentationMode) var presentationMode
    var body: some View {
        //Testing out Button Actions in the view
            VStack {
                Text("Total Water Today")
                .bold()
                .underline()
                    .bold()
                
                if userWater.water <= 20 {
                    Text("\(userWater.dailyWaterDisplay())")
                        .font(.largeTitle)
                        .foregroundColor(Color.red)
                } else if userWater.water <= 100 {
                    Text("\(self.userWater.dailyWaterDisplay())")
                        .font(.largeTitle)
                        .foregroundColor(Color.yellow)
                } else if userWater.water > 100 {
                    Text("\(self.userWater.dailyWaterDisplay())")
                        .font(.largeTitle)
                        .foregroundColor(Color.green)
                }
                Spacer()
                //Text("Last Water Added was \(self.lastWaterAdded)")
                Text("\(waterTotal) OZ").bold().font(.largeTitle)
                Text("")
                Button(action: {
                    self.userWater.addWaterDaily(waterDisplay: self.lastWaterAdded)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Add previous / \(lastWaterAdded)").font(.body).background(Color.blue).foregroundColor(Color.white).cornerRadius(15)
                }
                Spacer()
                Button(action: {
                    self.userWater.addWaterDaily(waterDisplay: self.waterTotal)
                    self.lastWaterAdded = self.waterTotal
                    self.waterTotal = 0
                }) {
                    Text("Confirm").font(.title).background(Color.blue).foregroundColor(Color.white).cornerRadius(15)
                }
                Spacer()
                HStack {
                    Button(action: {
                        self.minusOne()
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "minus")
                                .font(.title)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(.infinity)
                                .shadow(color: Color.blue, radius: 20, y: 5)
                                
                        }
                        Spacer()
                        
                    
                    Button(action: {
                        self.addOne()
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Spacer()
                        Image(systemName: "plus")
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(.infinity)
                        .shadow(color: Color.blue, radius: 20, y: 5)
                    }
            //Testing out plus button using system images
                
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

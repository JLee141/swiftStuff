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
    @ObservedObject var userWater = Liquid(Water: UserDefaults.standard.integer(forKey: "Water"), UnitMeasurement: "oz",WaterGoal: 102)
    //UserDefaults.standard.integer(forKey: "WaterGoal") put this in water goal for later.
    @State var waterTotal: Int = 0
    @State var lastWaterAdded: Int = 0
    @State var isShowingDetailView = false
    //@State var waterGoal = 102

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
    
    @State private var showingAlert = false
    
    var body: some View {
        //Testing out Button Actions in the view
        NavigationView {
                ZStack {
                    HStack {
                        VStack {
                            NavigationLink(destination: WaterGoalView(waterGoalBinding: userWater.waterGoal)) {
                    //self.waterGoal = self.userWater.waterGoal
                    Image(systemName: "drop")
                    Text("\(userWater.waterGoal)")
                    Spacer()
                }
                            
                    Spacer()
                        }
            }
                    
            VStack {
            
            //Add this later in future features
            //WaveBackgroundView()
            VStack {
                Text("Water Today")
                .underline()
                    .font(.title)
                    .fontWeight(.regular)
                userWater.dailyWaterDisplay()
                    .fontWeight(.medium)
                
                HStack {
                    Button(action: {
                        self.userWater.resetButton()
                        self.showingAlert = true
                    }) {
                        Text("Reset")
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("Reset Complete!"), message: Text("Water is set back to 0, this does not reset your goal 😎"), dismissButton: .default(Text("Sounds Good")))
                       }
                    }
                }
                Spacer()
                Text("\(waterTotal) oz")
                    .bold()
                    .font(.largeTitle)

                
                Button(action: {
                    self.addToTotal(water: self.lastWaterAdded)
                    
                }) {
                    Text("Previous : \(lastWaterAdded) oz").font(.system(size: 20)).background(Color.blue).foregroundColor(Color.white).cornerRadius(10).padding(.horizontal, 20)
                        .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 5)
                }
                Spacer()
                Button(action: {
                    self.userWater.recordWaterDaily(waterDisplay: self.waterTotal)
                    if self.waterTotal == 0{
                    }else{
                    self.lastWaterAdded = self.waterTotal
                    }
                    self.waterTotal = 0
                }) {
                    Text("Add").font(.largeTitle).background(Color.blue).foregroundColor(Color.white).cornerRadius(15).padding(.horizontal, 20)
                        .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 5)
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
                            .scaleEffect()
                            .hoverEffect(.automatic)
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
                            .scaleEffect()
                            .hoverEffect(.automatic)
                            
                        }
                    }
            }
        }
                }
                .padding(.leading)
                
        }.environmentObject(userWater)
    }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
        
    }
}
}

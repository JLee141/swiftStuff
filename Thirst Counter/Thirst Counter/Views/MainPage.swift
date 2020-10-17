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
    var userWater = Liquid(Water: UserDefaults.standard.integer(forKey: "Water"), UnitMeasurement: "oz",WaterGoal: UserDefaults.standard.integer(forKey: "WaterGoal"))
    
    @State var waterTotal: Int = 0
    @State var lastWaterAdded: Int = 0
    @State var showWaterGoalView = false
    @State var waterGoal: Int = 0
//    @State var todayDate: Date
//    @State var previousDate: Date

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
        ZStack {
            HStack {
                VStack {
                        HStack {
                            VStack {
                            Image(systemName: "drop")
                                .foregroundColor(.blue)
                            Button(action: {
                                self.showWaterGoalView = true
                            }){
                                Text("\(userWater.waterGoal)")
                            }.sheet(isPresented: self.$showWaterGoalView) {
                                WaterGoalView(waterGoalViewDisplayed: true,waterGoalBinding: userWater.waterGoal)
                               }.environmentObject(userWater)
                            }.padding()
                            .animation(.spring())
                                }
                    Spacer()
                            }
                    Spacer()
                        }
                    
            
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
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                    self.addToTotal(water: self.lastWaterAdded)
                }) {
                    Text("Previous : \(lastWaterAdded) oz").font(.system(size: 20)).background(Color.blue).foregroundColor(Color.white).cornerRadius(10).padding(.horizontal, 20)
                        .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 5)
                }
                Spacer()
                Button(action: {
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
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
        }.onAppear(perform: {
            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/
        })
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
        
    }
}

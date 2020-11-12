//
//  ContentView.swift
//  Thirst Counter
//
//  Created by Jordan Lee on 7/10/20.
//  Copyright © 2020 Jordan Lee. All rights reserved.
//

import SwiftUI
import Swift
import ConfettiView

struct MainPage: View {
    enum SheetView {
        case none
        case firstLaunch
        case goalView
    }
    var userWater = Liquid(Water: UserDefaults.standard.integer(forKey: "Water"), UnitMeasurement: "oz",WaterGoal: UserDefaults.standard.integer(forKey: "WaterGoal"), LastWaterAdded: UserDefaults.standard.integer(forKey: "LastWaterAdded"), SecondLaunch: UserDefaults.standard.bool(forKey: "SecondLaunch"))
    
    @State var waterTotal: Int = 0
    @State var lastWaterAdded: Int = 0
    @State var showGoalView = false
    @State var activeGoalView = SheetView.none
    @State var showFirstLaunch = false
    @State var waterGoalNumber = 0
    let impactMed = UIImpactFeedbackGenerator(style: .medium)
    let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
    
    @State var todayDate = DateComponents()
    @State var previousDate = DateComponents()
    
    //These functions control the variable water total which is what is shown
    func addOne() {
        self.waterTotal+=1
    }
    
    func addTen() {
        self.waterTotal+=10
    }
    
    func minusOne() {
        self.waterTotal-=1
    }
    
    func minusTen() {
        self.waterTotal-=10
    }
    
    func addToTotal(water:Int){
        self.waterTotal = water
    }
    
    func celebrationView(waterTotal:Int) -> some View {
        if waterTotal == userWater.waterGoal {
            return ConfettiCelebrationView()
        }
        return ConfettiCelebrationView()
    }
    
    func firstTimeLaunch() -> SheetView {
        if userWater.waterGoal == 0 {
            activeGoalView = SheetView.firstLaunch
            return activeGoalView
        } else {
            activeGoalView = SheetView.none
            return activeGoalView
        }
    }
    
//    func dateCheck() {
//        if userWater.previousDate == nil {
//            userWater.previousDate = Date()
//            UserDefaults
//        }
//    }
    
    @State private var showingAlert = false
    
    var body: some View {
        ZStack {
            celebrationView(waterTotal: waterTotal)
            HStack {
                VStack {
                        HStack {
                            VStack {
                            Image(systemName: "drop")
                                .foregroundColor(.blue)
                            
                            Button(action: {
                                activeGoalView = .firstLaunch
                                self.showGoalView = true
                            }){
                                Text("\(self.waterGoalNumber)")
                                    .animation(.easeInOut)
                            }.sheet(isPresented: $showGoalView, onDismiss: {
                                self.waterGoalNumber = userWater.waterGoal
                            }) {
                                if activeGoalView == SheetView.firstLaunch {
                                    WelcomeScreen(waterGoalBinding: userWater.waterGoal)
                                    .environmentObject(userWater)
                                } else {
                                WaterGoalView(waterGoalBinding: userWater.waterGoal)
                                    .environmentObject(userWater)
                                    }
                               }
                            }.padding()
                            .animation(.spring())
                                }
                    Spacer()
                    }
                    Spacer()
            }.onAppear(
                
            )
                    
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
                    impactMed.impactOccurred()
                    self.addToTotal(water: self.lastWaterAdded)
                }) {
                    Text("Previous : \(self.lastWaterAdded) oz").font(.system(size: 20)).background(Color.blue).foregroundColor(Color.white).cornerRadius(10).padding(.horizontal, 20)
                        .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 5)
                }
                Spacer()
                Button(action: {
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
                    }) {
                        Image(systemName: "minus")
                            .font(.system(size: 25, weight: .semibold, design: .rounded))
                            .frame(width: 60, height: 60)
                            .cornerRadius(20)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .onTapGesture {
                                minusOne()
                            }
                            .onLongPressGesture(minimumDuration: 0.05){
                                minusTen()
                                impactHeavy.impactOccurred()
                            }
                    }
                    Spacer()
                    Button(action: {
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 25, weight: .semibold, design: .rounded))
                            .frame(width: 60, height: 60)
                            .cornerRadius(20)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .onTapGesture {
                                addOne()
                            }
                            .onLongPressGesture(minimumDuration: 0.05) {
                                addTen()
                                impactHeavy.impactOccurred()
                                }
                        }
                    }
            }
        }.onAppear(perform:) {
//            if userWater.waterGoal == 0 {
//                //self.activeGoalView = .firstLaunch
//                self.showFirstLaunch = true
//            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 7.5) {
                        
                    }
            self.waterGoalNumber = userWater.waterGoal
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

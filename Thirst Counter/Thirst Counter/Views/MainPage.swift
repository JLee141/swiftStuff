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
import UserNotifications

struct MainPage: View {
    enum SheetView {
        case none
        case firstLaunch
        case goalView
    }
    var userWater = Liquid(Water: UserDefaults.standard.integer(forKey: "Water"), UnitMeasurement: "oz",WaterGoal: UserDefaults.standard.integer(forKey: "WaterGoal"), SecondLaunch: UserDefaults.standard.bool(forKey: "SecondLaunch"))
    //WaterTotal is used as a binding concept to calculate user's water throughout the
    @State var waterTotalDisplay: Int = 0
    @State var lastWaterAdded: Int = 0
    @State var showGoalView = false
    @State var showFirstLaunch = false
    @State var waterGoalNumber = 0
    let impactMed = UIImpactFeedbackGenerator(style: .medium)
    let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
    let impactLight = UIImpactFeedbackGenerator(style: .light)
    //This key is true to find out the app has ran before. EXAMPLE: True is default for application, set false to reset run then next time change back.
    var firstTimeLaunchKey = true
    @State var todaysDate = Date()
    let dateFormatter = DateFormatter()
    //Alert Varible for my main page
    @State private var showingAlert = false
    
    //This function checks to see if a user default key is in a place
    func isKeySetInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    //These functions control the variable water total which is what is shown
    func addOne() {
        self.waterTotalDisplay+=1
    }
    
    func addTen() {
        self.waterTotalDisplay+=10
    }
    
    func minusOne() {
        self.waterTotalDisplay-=1
    }
    
    func minusTen() {
        self.waterTotalDisplay-=10
    }
    
    func addToTotal(water:Int){
        self.waterTotalDisplay = water
    }
    
    func celebrationView(waterTotal:Int) -> some View {
        if waterTotal >= userWater.waterGoal {
            ConfettiCelebrationView().isShowingConfetti = true
            return ConfettiCelebrationView()
        }
        return ConfettiCelebrationView()
    }
    
    //This date check is responsible for resetting water goal every day
    func dateCheck() {
        dateFormatter.dateFormat = "MMddyyyy"
        let todaysDateInt = Int(dateFormatter.string(from: todaysDate))
        UserDefaults.standard.set(todaysDateInt,forKey: "todaysDate")
        if !isKeySetInUserDefaults(key: UserDefaults.standard.string(forKey: "oldDate")!){
            UserDefaults.standard.set(todaysDateInt,forKey: "oldDate")
        }else if UserDefaults.standard.integer(forKey: "oldDate") != UserDefaults.standard.integer(forKey: "newDate") {
            userWater.resetWater()
            UserDefaults.standard.set(todaysDateInt,forKey: "oldDate")
        }
    }
    
    
    
    var body: some View {
        ZStack {
            celebrationView(waterTotal: waterTotalDisplay)
            if showFirstLaunch == true {
                withAnimation(Animation.easeIn) {
                    ZStack {
                    }.sheet(isPresented: $showFirstLaunch, onDismiss: {
                        self.waterGoalNumber = userWater.waterGoal
                        showFirstLaunch = false
                    }) {
                        WelcomeScreen(waterGoalBinding: userWater.waterGoal)
                            .environmentObject(userWater)
                        }
                }
            }
            HStack {
                VStack {
                        HStack {
                            VStack {
                            Image(systemName: "drop")
                                .foregroundColor(.blue)
                            
                            Button(action: {
                                self.showGoalView = true
                            }){
                                Text("\(self.waterGoalNumber)")
                                    .animation(.easeInOut)
                            }.sheet(isPresented: $showGoalView, onDismiss: {
                                self.waterGoalNumber = userWater.waterGoal
                            }) {
                                WaterGoalView(waterGoalBinding: userWater.waterGoal)
                                    .environmentObject(userWater)
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
                        self.userWater.resetWater()
                        self.showingAlert = true
                    }) {
                        Text("Reset")
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("Reset Complete!"), message: Text("Water is set back to 0, this does not reset your goal 😎"), dismissButton: .default(Text("Sounds Good")))
                       }
                    }
                }
                Spacer()
                Text("\(waterTotalDisplay) oz")
                    .bold()
                    .font(.largeTitle)

                
                Button(action: {
                    impactLight.impactOccurred()
                    self.addToTotal(water: self.lastWaterAdded)
                    
                }) {
                    Text("Previous : \(self.lastWaterAdded) oz")
                        .font(.system(size: 20)).background(Color.blue).foregroundColor(Color.white).cornerRadius(10).padding(.horizontal, 20)
                            .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 5)
//                    Text("Previous : \(userWater.lastWaterAdded) oz").font(.system(size: 20)).background(Color.blue).foregroundColor(Color.white).cornerRadius(10).padding(.horizontal, 20)
//                        .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 5)
                }
                Spacer()
                Button(action: {
                    impactHeavy.impactOccurred()
                    self.userWater.recordWaterDaily(waterDisplay: self.waterTotalDisplay)
                    if self.waterTotalDisplay == 0{
                    }else{
                        self.lastWaterAdded = self.waterTotalDisplay
                        UserDefaults.standard.set(self.lastWaterAdded,forKey: "LastWaterAdded")
                    }
                    self.waterTotalDisplay = 0
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
                                impactLight.impactOccurred()
                                minusOne()
                            }
                        .onLongPressGesture(minimumDuration: 0.5){
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
                                impactLight.impactOccurred()
                                addOne()
                            }
                            .onLongPressGesture(minimumDuration: 0.5) {
                                addTen()
                                impactHeavy.impactOccurred()
                                }
                        }
                    }
            }
        }.onAppear(perform:) {
            //This reflects the watergoal to the State Variable on the main page
            self.waterGoalNumber = userWater.waterGoal
            
            //Sets the proper date format for how dates are recorded in the app
            dateCheck()
            self.lastWaterAdded = UserDefaults.standard.integer(forKey: "LastWaterAdded")
            
            //This controls the firsttime experience
            if self.firstTimeLaunchKey != UserDefaults.standard.bool(forKey: "FirstTimeLaunch") {
                self.showFirstLaunch = true
                UserDefaults.standard.set(firstTimeLaunchKey, forKey: "FirstTimeLaunch")
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

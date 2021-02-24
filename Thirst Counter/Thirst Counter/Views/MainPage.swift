//
//  ContentView.swift
//  Thirst Counter
//
//  Created by Jordan Lee on 7/10/20.
//  Copyright © 2021 Jordan Lee. All rights reserved.
//

import SwiftUI
import Swift
import UserNotifications

//This checks events throughout the app including entering foreground
class Observer: ObservableObject {
    @Published var enteredForeground = true
    init() {
        if #available(iOS 14.0, *) {
            NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: UIScene.willEnterForegroundNotification, object: nil)
        } else {
            NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        }
    }
    //Function to toggle Forground state
    @objc func willEnterForeground() {
        enteredForeground.toggle()
    }
}

struct MainPage: View {

    //The class I use to keep water organized, I reference it with userWater.
    var userWater = Liquid(Water: UserDefaults.standard.integer(forKey: "Water"), UnitMeasurement: "oz",WaterGoal: UserDefaults.standard.integer(forKey: "WaterGoal"), SecondLaunch: UserDefaults.standard.bool(forKey: "SecondLaunch"))
    
    //WaterTotal is used as a binding concept to calculate user's water throughout the
    @State private var waterTotalDisplay: Int = 0
    @State private var lastWaterAdded: Int = 0
    @State private var showGoalView = false
    @State private var showDonationView = false
    @State private var showFirstLaunch = false
    @State private var waterGoalNumber = 0
    @State public var goalComplete = false
    @State private var goalCompleteCount = 0
    private let goalCompleteCap = 1
    @State private var scaleFactor: CGFloat = 1
    
    //Both of these are used for animations
    @State var viewState = CGSize.zero
    @Namespace private var animation

    
    //All the haptic feedback calls I use in the app.
    private let impactMed = UIImpactFeedbackGenerator(style: .medium)
    private let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
    private let impactLight = UIImpactFeedbackGenerator(style: .light)
    
    //This key is true to find out the app has ran before. EXAMPLE: True is default for application, set false to reset run then next time change back.
    public var firstTimeLaunchKey = true
    
    //This observes app events, refer to class created on line
    @ObservedObject var observer = Observer()
    
    //Todays Date, used to compare in Date function with old date
    @State var todaysDate = Date()
    
    //This formats the date so I can use it in my function.
    let dateFormatter = DateFormatter()
    
    let notificationName = Notification.Name.NSCalendarDayChanged
    
    // Register to receive notification
//    NotificationCenter.default.addObserver(self, selector: #selector(calendarDayDidChange(notification:)), name: notificationName, object: nil)
    
//    func calendarDayDidChange(notification : NSNotification) {
//        dateCheck()
//    }
    
    
    //Alert for easter egg 😎
    @State private var easterEggZeroCount = 0
    @State private var easterEggAlert = false
    
    //Alert Varible for my main page
    @State private var showingResetAlert = false
    //@State private var isShowingConfetti: Bool = false
    
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
    //End of Water Total Display functions
    
    //Checks Celebration and runs a goal complete @State toggle
    func celebrationCheckView() {
        //Checks for goal and activates goal complete \*/
        //First Checks if dailywater is zero, if it is we don't need to run.
        if self.userWater.dailyWater != 0 {
            //Checks goal this is main condition
            if self.userWater.dailyWater >= userWater.waterGoal {
                //Checks cap, I don't want to continue after it ran once
                if goalCompleteCap > goalCompleteCount {
                    self.goalComplete.toggle()
                    self.goalCompleteCount+=1
                    }
                }
            }else{
                self.goalCompleteCount = 0
                self.goalComplete = false
        }
    }
    

    //This date check is responsible for resetting water goal every day
    func dateCheck() {
        todaysDate = Date()
        dateFormatter.dateFormat  = "MMddyyyy"
        let todaysDateInt = Int(dateFormatter.string(from: todaysDate))
        UserDefaults.standard.set(todaysDateInt,forKey: "todaysDate")
        let previousDateInt = UserDefaults.standard.integer(forKey: "oldDate")
        if isKeySetInUserDefaults(key: "oldDate") {
            if previousDateInt != todaysDateInt {
                userWater.resetWater()
                UserDefaults.standard.set(todaysDateInt,forKey: "oldDate")
            }
        } else {
            UserDefaults.standard.set(todaysDateInt,forKey: "oldDate")
        }
        celebrationCheckView()
    }
    
    var body: some View {
        ZStack {
            //if GoalComplete toggles then celebrationView pops
            if self.goalComplete {
                    ConfettiCelebrationView()
                        
                //goalCompleteCount = goalCompleteCap
            }
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
                                self.showGoalView.toggle()
                            }){
                                Text("\(self.waterGoalNumber)")
                                    .animation(.easeInOut)
                            }.sheet(isPresented: $showGoalView, onDismiss: {
                                self.waterGoalNumber = userWater.waterGoal
                                celebrationCheckView()
                            }) {
                                WaterGoalView(waterGoalBinding: userWater.waterGoal)
                                    .environmentObject(userWater)
                               }
                            }
                            
                            Spacer()
                            Button(action: {
                                self.showDonationView.toggle()
                            }){
                                Image(systemName: "banknote")
                            }.sheet(isPresented: $showDonationView, content: {
                                DonationView()
                            })
                            
                                }
                    
                    Spacer()
                    }
                .padding()
                    Spacer()
                
            }
                    
            //Add this later in future features
            //WaveBackgroundView()
            VStack {
                HStack {
                    Text("Today")
                    .underline()
                        .font(.largeTitle)
                        .fontWeight(.regular)
                }
                    //Add different font for title
                userWater.dailyWaterDisplay()
                    .font(.largeTitle)
                    .fontWeight(.medium)
                
                
                HStack {
                    Button(action: {
                        self.userWater.resetWater()
                        celebrationCheckView()
                        self.showingResetAlert.toggle()
                    }) {
                        Text("Reset")
                        .alert(isPresented: $showingResetAlert) {
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
                    dateCheck()
                    self.addToTotal(water: self.lastWaterAdded)
                }) {
                    Text("Previous : \(self.lastWaterAdded) oz")
                        .font(.system(size: 20)).background(Color.blue).foregroundColor(Color.white).cornerRadius(10).padding(.horizontal, 50)
                            .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 5)
//                    Text("Previous : \(userWater.lastWaterAdded) oz").font(.system(size: 20)).background(Color.blue).foregroundColor(Color.white).cornerRadius(10).padding(.horizontal, 20)
//                        .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 5)
                }
                Spacer()
                Button(action: {
                    impactHeavy.impactOccurred()
                    dateCheck()
                    self.userWater.recordWaterDaily(waterDisplay: self.waterTotalDisplay)
                    if self.waterTotalDisplay == 0{
                        easterEggZeroCount = easterEggZeroCount+1
                        if easterEggZeroCount > 3{
                            
                        }
                    }else{
                        self.lastWaterAdded = self.waterTotalDisplay
                        UserDefaults.standard.set(self.lastWaterAdded,forKey: "LastWaterAdded")
                        self.waterTotalDisplay = 0
                    }
                    celebrationCheckView()
                    
                }) {
                    Text("Add").font(.largeTitle).background(Color.blue).foregroundColor(Color.white).cornerRadius(15).padding(.horizontal, 15)
                        .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 5)
                }
                
                //All the buttons
                HStack {
                    Button(action: {
                    }) {
                        Image(systemName: "minus")
                        .font(.system(size: 30, weight: .semibold, design: .rounded))
                        .frame(width: 60, height: 60)
                        .cornerRadius(20)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        //Tap for minusOne
                        .onTapGesture {
                                impactLight.impactOccurred()
                                minusOne()
                        }
                        //Longpress for Minus 10
                        .onLongPressGesture(minimumDuration: 0){
                                minusTen()
                                impactHeavy.impactOccurred()
                            }
                    }
                    Spacer()
                    Button(action: {
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 30, weight: .semibold, design: .rounded))
                            .frame(width: 60, height: 60)
                            .cornerRadius(20)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                             .onTapGesture {
                                impactLight.impactOccurred()
                                addOne()
                            }
                            .onLongPressGesture(minimumDuration: 0) {
                                addTen()
                                impactHeavy.impactOccurred()
                                }
                    }
                    }
            }
        }
        .onAppear(perform:) {
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
        .onReceive(self.observer.$enteredForeground) { _ in
                    dateCheck()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

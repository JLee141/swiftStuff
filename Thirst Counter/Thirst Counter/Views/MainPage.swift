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
import iPages

//This checks events throughout the app including entering foreground
//class Observer: ObservableObject {
//
//    @Published var enteredForeground = false
//
//    //Function to toggle Forground state
//    @objc func willEnterForeground() {
//        enteredForeground.toggle()
//    }
//    init() {
//        if #available(iOS 14.0, *) {
//            NotificationCenter.default.addObserver(self, selector: #selector(self.willEnterForeground), name: UIScene.willEnterForegroundNotification, object: nil)
//        } else {
//            NotificationCenter.default.addObserver(self, selector: #selector(self.willEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
//        }
//    }
//}


struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.blue)
            .padding()
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
            .cornerRadius(15.0)
            .font(.system(size: 40, weight: .semibold, design: .rounded))
            .frame(width: 60, height: 60)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .circular))
    }
}



struct MainPage: View {

    //The class I use to keep water organized, I reference it with userWater.
    @State var userWater = LiquidModel(liquid: UserDefaults.standard.integer(forKey: "TotalLiquidAmount"),liquidName: UserDefaults.standard.string(forKey: "LiquidName") ?? "Water", unitMeasurement: "oz",liquidGoal: UserDefaults.standard.integer(forKey: "LiquidGoal"), secondLaunch: UserDefaults.standard.bool(forKey: "SecondLaunch"))
    
    //WaterTotal is used as a binding concept to calculate user's water throughout the
    @State private var liquidUserTotal: Int = 0
    @State private var liquidTotalDisplay: Int = 0
    
    @State private var lastWaterAdded: Int = 0
    @State private var showGoalView = false
    @State private var showDonationView = false
    @State private var showFirstLaunch = false
    @State private var showLiquidView = false
    @State private var waterGoalNumber = 0
    @State public var goalComplete = false
    @State private var goalCompleteCount = 0
    private let goalCompleteCap = 1
    @State private var scaleFactor: CGFloat = 1
    
    @State private var toggleShakeAnimation = false
    
    //List of available measurements
    @State var unitMeasurements = ["oz","cups"]
    @State var unitMeasurement:String = "oz"
    @State var pickerExpand = false
    
    //Controls drag views
    @State var drag = DragGesture()
    
    //Both of these are used for animations
    @State var viewState = CGSize.zero
    @Namespace private var animation
    
    

    //All the haptic feedback calls I use in the app.
    private let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
    private let impactMed = UIImpactFeedbackGenerator(style: .medium)
    private let impactLight = UIImpactFeedbackGenerator(style: .light)
    
    //This key is true to find out the app has ran before. EXAMPLE: True is default for application, set false to reset run then next time change back.
    public var firstTimeLaunchKey = true
    
    //This observes app events, refer to class created on line 14*
    //@State var observer = Observer()
    
    //Todays Date, used to compare in Date function with old date
    @State var todaysDate = Date()
    
    //This formats the date so I can use it in my function.
    let dateFormatter = DateFormatter()
    
    let notificationName = Notification.Name.NSCalendarDayChanged
    
    //Going to use this state to incorperate another view
    let dragGesture = DragGesture()
    
    // Register to receive notification
//    NotificationCenter.default.addObserver(self, selector: #selector(calendarDayDidChange(notification:)), name: notificationName, object: nil)
    
//    func calendarDayDidChange(notification : NSNotification) {
//        dateCheck()
//    }
    
    
    
    //Alert for easter egg 😎
    @State private var easterEggCount = 0
    @State private var easterEggAlert = false
    @State private var easterEggMaxCelebration = 0
    
    //Alert Varible for my main page
    @State private var showingResetAlert = false
    //@State private var isShowingConfetti: Bool = false
    
    //This function checks to see if a user default key is in a place
    func isKeySetInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    
    //These functions control the variable water binding that eventually adds to total
    func addOne() {
        self.liquidUserTotal+=1
    }
    
    func addTen() {
        self.liquidUserTotal+=10
    }
    
    func minusOne() {
        self.liquidUserTotal-=1
    }
    
    func minusTen() {
        self.liquidUserTotal-=10
    }
    
    //This adds to the water total amount when the user clicks add.
    func addToTotal(water:Int){
        self.liquidUserTotal = water
    }
    //End of Water Total Display functions
    
    //Checks Celebration and runs a goal complete @State toggle
    func celebrationCheckView() {
        //Checks for goal and activates goal complete \*/
        //First Checks if dailywater is zero, if it is we don't need to run.
        if self.userWater.dailyLiquid != 0 {
            //Checks goal this is main condition
            if self.userWater.dailyLiquid >= userWater.liquidGoal {
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
    
    func easterEggCelebration() {
        if easterEggMaxCelebration < 1 {
            if self.easterEggCount > 10 {
                self.easterEggAlert.toggle()
                self.easterEggCount = 0
                self.easterEggMaxCelebration+=1
        }else{
            self.easterEggCount+=1
            }
        }
        //easterEggMaxCelebration
    }
    

    //This date check function is responsible for resetting water goal every day
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
        iPages {
            ZStack {
                //if GoalComplete toggles then celebrationView pops
                if self.goalComplete {
                        ConfettiCelebrationView()
                            
                    //goalCompleteCount = goalCompleteCap
                }
                if self.easterEggAlert {
                    EasterEggCelebration()
                }
                
                //This is hidden in the ZStack because of the UIKit implimentation but this will allow the device to register shakes.
                ShakableViewRepresentable().allowsHitTesting(false)
                if showFirstLaunch == true {
                    withAnimation(Animation.easeIn) {
                        ZStack {
                        }.sheet(isPresented: $showFirstLaunch, onDismiss: {
                            self.waterGoalNumber = userWater.liquidGoal
                            showFirstLaunch = false
                        }) {
                            WelcomeScreen(waterGoalBinding: userWater.liquidGoal)
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
                                    self.waterGoalNumber = userWater.liquidGoal
                                    celebrationCheckView()
                                }) {
                                    WaterGoalView(waterGoalBinding: userWater.liquidGoal)
                                        .environmentObject(userWater)
                                   }
                                }
                                
                                Spacer()
                                
                                //Donation view
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
                        Button(action: {
                            self.showLiquidView.toggle()
                        }){
                            Text("\(userWater.liquidName)")
                            .underline()
                                .font(.largeTitle)
                                .fontWeight(.regular)
                        }

                    }.sheet(isPresented: $showLiquidView, content: {
                        LiquidChooseView()
                    })
                    userWater.dailyLiquidDisplay()
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
                    Text("\(liquidUserTotal) oz")
                        .bold()
                        .font(.largeTitle)
                    
                    //toggleShakeAnimation
                    
                    Button(action: {
                        impactLight.impactOccurred()
                        self.addToTotal(water: self.lastWaterAdded)
                    }) {
                        Text("Previous : \(self.lastWaterAdded) oz")
                            .font(.title2).background(Color.blue).foregroundColor(Color.white).cornerRadius(10).padding(.horizontal, 20)
                                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
    //                    Text("Previous : \(userWater.lastWaterAdded) oz").font(.system(size: 20)).background(Color.blue).foregroundColor(Color.white).cornerRadius(10).padding(.horizontal, 20)
    //                        .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 5)
                    }
                    Spacer()
                    Button(action: {
                        impactHeavy.impactOccurred()
                        self.userWater.recordLiquidDaily(liquidDisplay: self.liquidUserTotal)
                        if self.liquidUserTotal == 0 {
                            //easterEggCount = easterEggCount+1
                            easterEggCelebration()
                        }else{
                            self.lastWaterAdded = self.liquidUserTotal
                            UserDefaults.standard.set(self.lastWaterAdded,forKey: "LastLiquidAdded")
                            self.liquidUserTotal = 0
                        }
                        celebrationCheckView()
                        
                    }) {
                        Text("Add").font(.largeTitle).background(Color.blue).foregroundColor(Color.white).cornerRadius(15).padding(.horizontal, 15)
                            .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                    }
                    
                    //All the buttons
                    HStack {
                        Button(action: {
                        }) {
                            Image(systemName: "minus")
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
                        }.buttonStyle(CustomButtonStyle())
                        
                        Spacer()
                        Button(action: {
                            
                        }) {
                            Image(systemName: "plus")
                                .font(.system(size: 40, weight: .semibold, design: .rounded))
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
                            
                        }.buttonStyle(CustomButtonStyle())
                    }
                }
            }
            .onAppear(perform:) {
                //This reflects the watergoal to the State Variable on the main page
                self.waterGoalNumber = userWater.liquidGoal
                self.liquidTotalDisplay = userWater.dailyLiquid
                
                //Sets the proper date format for how dates are recorded in the app
                dateCheck()
                
                self.lastWaterAdded = UserDefaults.standard.integer(forKey: "LastLiquidAdded")
                
                //This controls the firsttime experience
                if self.firstTimeLaunchKey != UserDefaults.standard.bool(forKey: "FirstTimeLaunch") {
                    self.showFirstLaunch = true
                    UserDefaults.standard.set(firstTimeLaunchKey, forKey: "FirstTimeLaunch")
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                self.userWater.resetWater()
                dateCheck()
                }
    //        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
    //                self.userWater.resetWater()
    //            }
            .onReceive(messagePublisher) { _ in
                    impactHeavy.impactOccurred()
                    self.liquidUserTotal = 0
        }
        }
        
        
        
    }
}
struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

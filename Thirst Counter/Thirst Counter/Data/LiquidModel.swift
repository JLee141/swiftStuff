//
//  LiquidIntake.swift
//  Thirst Counter
//
//  Created by Jordan Lee on 7/15/20.
//  Copyright © 2020 Jordan Lee. All rights reserved.
//

import Foundation
import SwiftUI
import Swift
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

class LiquidModel: ObservableObject {
    //This is requirement for inheriting Identifiable class
    //var id:String = UUID().uuidString
    var userName: String
    //var liquidPerDayAmount: Int
    @Published var dailyWater: Int
    //var dailyLiquid: Int //May use this later.
    //To use later to record dates with amount of water consumed
    //var waterRecorededDaily:[Int] = []
    
    @State private var congratsViewAlert = false
    @Published var waterGoal: Int
    @State var unitMeasurement: String
    @State var unitMeasurements = ["oz","cups"]
    @State var secondLaunch: Bool
    
    


    //Initilizer, organizes all the data into the right spots.
    init(Water: Int,UnitMeasurement: String, WaterGoal: Int,SecondLaunch: Bool) {
        self.dailyWater = Water
        self.userName = ""
        self.unitMeasurement = UnitMeasurement
        self.waterGoal = WaterGoal
        self.secondLaunch = SecondLaunch
        //self.previousDate = savedDate
    }
    
    //This displays the TOTAL water for the day and color coats it based on completion.
    func dailyWaterDisplay() -> Text {
        let waterString = "\(self.dailyWater)"
        if dailyWater < waterGoal/2 {
            return Text("\(waterString) \(unitMeasurement)")
                .font(.largeTitle)
                .foregroundColor(Color.red)
        }else if dailyWater >= waterGoal/2 {
            if dailyWater >= waterGoal {
            return Text("\(waterString) \(unitMeasurement)")
                        .font(.largeTitle)
                        .foregroundColor(Color.green)
            }else{
            return Text("\(waterString) \(unitMeasurement)")
                        .font(.largeTitle)
                    .foregroundColor(Color.yellow)
            }
        }
        return Text("\(waterString) \(unitMeasurement)")
            .font(.largeTitle)
            //.foregroundColor(Color.yellow)
    }
    
    
    
    //Adds +1 to the water displayed.
    func plusOne(displayWater: Int) {
        self.dailyWater = displayWater+1
        
    }
    //Adds -1 to the water displayed.
    func minusOne(displayWater: Int) {
        self.dailyWater = displayWater-1
    }
    
//    //Displays watergoal as a text
//    func waterGoalDisplay() -> Text {
//        return Text("\(self.waterGoal)")
//    }
//    
//    func waterGoalDisplay(waterGoalView: Bool) -> Text {
//        let waterGoalString = "\(self.waterGoal)"
//        return Text("\(waterGoalString)")
//    }
    
    func plusOneWaterGoal(displayWater: Int) {
        self.waterGoal = displayWater+1
    }
    
    func minusOneWaterGoal(displayWater: Int) {
        self.waterGoal = displayWater+1
    }
    
    //Passes through variable of water displayed and adds it to the daily water intake.
    func recordWaterDaily(waterDisplay: Int) {
        self.dailyWater = self.dailyWater+waterDisplay
        //This will help when the app closes in the background the app will remember the amount of water.
        UserDefaults.standard.set(self.dailyWater, forKey: "Water")
    }
//    func recordLastWater(lastWaterAdded: Int) {
//        self.lastWaterAdded = lastWaterAdded
//
//        UserDefaults.standard.set(self.lastWaterAdded, forKey: "LastWaterAdded")
//    }
    
    //Resets total water daily to 0 for a forced reset.
    func resetWater() {
        self.dailyWater = 0
        UserDefaults.standard.set(self.dailyWater, forKey: "Water")
    }
    
    
    //Set's watergoal and saves it in the userkey
    func recordWaterGoal(waterGoal: Int) {
        self.waterGoal = waterGoal
        //Records
        UserDefaults.standard.set(self.waterGoal, forKey:"WaterGoal")
    }
    
//    func waterPreviousDisplay() -> Text {
//        let waterPrevious = "\(self.lastWaterAdded)"
//        return Text("Previous : \(waterPrevious) oz")
//    }
    //UserDefaults.standard.integer(forKey: "LastWaterAdded")
}

class waterRecord: ObservableObject {
    
}

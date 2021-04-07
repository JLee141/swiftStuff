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

class LiquidModel: ObservableObject {
    //This is requirement for inheriting Identifiable class
    //var id:String = UUID().uuidString
    var liquidName: String
    //var liquidPerDayAmount: Int
    
    @Published var dailyLiquid: Int
    //var dailyLiquid: Int //May use this later.
    //To use later to record dates with amount of water consumed
    //var waterRecorededDaily:[Int] = []
    
    @State private var congratsViewAlert = false
    @Published var liquidGoal: Int
    @Published var unitMeasurement: String
    @State var unitMeasurements = ["oz","cups"]
    @State var secondLaunch: Bool
    
    

    //Initilizer, organizes all the data into the right spots.
    init(liquid: Int, liquidName: String,unitMeasurement: String, liquidGoal: Int,secondLaunch: Bool) {
        self.dailyLiquid = liquid
        self.liquidName = liquidName
        self.unitMeasurement = unitMeasurement
        self.liquidGoal = liquidGoal
        self.secondLaunch = secondLaunch
        //self.previousDate = savedDate
    }
    
    //This displays the TOTAL water for the day and color coats it based on completion.
    func dailyLiquidDisplay() -> Text {
        let waterString = "\(self.dailyLiquid)"
        if dailyLiquid < liquidGoal/2 {
            return Text("\(waterString) \(unitMeasurement)")
                .font(.largeTitle)
                .foregroundColor(Color.red)
        }else if dailyLiquid >= liquidGoal/2 {
            if dailyLiquid >= liquidGoal {
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
        self.dailyLiquid = displayWater+1
        
    }
    //Adds -1 to the water displayed.
    func minusOne(displayWater: Int) {
        self.dailyLiquid = displayWater-1
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
        self.liquidGoal = displayWater+1
    }
    
    func minusOneWaterGoal(displayWater: Int) {
        self.liquidGoal = displayWater+1
    }
    
    //Passes through variable of water displayed and adds it to the daily water intake.
    func recordLiquidDaily(liquidDisplay: Int) {
        self.dailyLiquid = self.dailyLiquid+liquidDisplay
        //This will help when the app closes in the background the app will remember the amount of water.
        UserDefaults.standard.set(self.dailyLiquid, forKey: "TotalLiquidAmount")
    }
//    func recordLastWater(lastWaterAdded: Int) {
//        self.lastWaterAdded = lastWaterAdded
//
//        UserDefaults.standard.set(self.lastWaterAdded, forKey: "LastWaterAdded")
//    }
    
    //Resets total water daily to 0 for a forced reset.
    func resetWater() {
        self.dailyLiquid = 0
        UserDefaults.standard.set(self.dailyLiquid, forKey: "TotalLiquidAmount")
    }
    
    
    //Set's watergoal and saves it in the userkey
    func recordWaterGoal(waterGoal: Int) {
        self.liquidGoal = waterGoal
        //Records
        UserDefaults.standard.set(self.liquidGoal, forKey:"LiquidGoal")
    }
    
//    func waterPreviousDisplay() -> Text {
//        let waterPrevious = "\(self.lastWaterAdded)"
//        return Text("Previous : \(waterPrevious) oz")
//    }
    //UserDefaults.standard.integer(forKey: "LastWaterAdded")
}

class waterRecord: ObservableObject {
    
}


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

class Liquid: ObservableObject {
    //This is requirement for inheriting Identifiable class
    //var id:String = UUID().uuidString
    var userName: String
    //var liquidPerDayAmount: Int
    @Published var water: Int
    //var dailyLiquid: Int //May use this later.
    //To use later to record dates with amount of water consumed
    //var waterRecorededDaily:[Int] = []
    
    var waterGoal: Int
    var unitMeasurement:String
    
    //This is to create a reference date so that water can reset everyday
    var referenceDate = Date()
    //let calendar = Calendar.current
    
    var dateComponents = DateComponents(calendar: Calendar.current, hour:24)
    
    init(Water: Int,UnitMeasurement: String, WaterGoal: Int ) {
        self.water = Water
        self.userName = ""
        self.unitMeasurement = UnitMeasurement
        self.waterGoal = WaterGoal
    }
    
    //This displays the TOTAL water for the day and color coats it based on completion.
    func dailyWaterDisplay() -> Text {
        //let dailyWaterString = "\(water)"
        let waterString = "\(self.water)"
        if water == 0 {
            return Text("\(waterString) \(unitMeasurement)")
                .font(.largeTitle)
                .foregroundColor(Color.red)
        }else if water <= waterGoal%20 {
        return Text("\(waterString) \(unitMeasurement)")
                .font(.largeTitle)
                .foregroundColor(Color.red)
        }else if water <= 100 {
        return Text("\(waterString) \(unitMeasurement)")
                .font(.largeTitle)
                .foregroundColor(Color.yellow)
        }else if water > 100 {
        return Text("\(waterString) \(unitMeasurement)")
                .font(.largeTitle)
                .foregroundColor(Color.green)
        }
        return Text("\(waterString)")
    }
    //Adds +1 to the water displayed.
    func plusOne(displayWater: Int) {
        self.water = displayWater+1
    }
    //Adds -1 to the water displayed.
    func minusOne(displayWater: Int) {
        self.water = displayWater-1
    }
    
    func waterGoalDisplay() -> Text {
        //let waterGoalString = "\(self.waterGoal)"
        return Text("Current Water Goal: \(self.waterGoal)")
    }
    
    //Passes through variable of water displayed and adds it to the daily water intake.
    func recordWaterDaily(waterDisplay: Int) {
        self.water = self.water+waterDisplay
        //This will help when the app closes in the background the app will remember the amount of water.
        UserDefaults.standard.set(self.water, forKey: "Water")
    }
    
    //Resets total water daily to 0 for a forced reset.
    func resetButton() {
        self.water = 0
    }
    
    func recordWaterGoal(waterGoalRecord: Int) {
        self.waterGoal = waterGoalRecord
        UserDefaults.standard.set(self.waterGoal, forKey:"WaterGoal")
    }
    
}

class waterRecord: ObservableObject {
    
}

struct LiquidIntake_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

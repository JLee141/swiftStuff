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
    var waterRecorededDaily:[Int] = []
    var waterGoal: Int
    
    //This is to create a reference date so that water can reset everyday
    var referenceDate = Date()
    //let calendar = Calendar.current
    
    var dateComponents = DateComponents(calendar: Calendar.current, hour:24)
    
    init(Water: Int) {
        self.water = Water
        self.waterGoal = 135
        self.userName = ""
    }
    
    
    
    //This displays the TOTAL water for the day.
    func dailyWaterDisplay() -> Text {
        //let dailyWaterString = "\(water)"
        let waterString = "\(self.water)"
        if water == 0 {
            return Text(waterString).font(.largeTitle)
            .foregroundColor(Color.red)
        }else if water <= waterGoal%20 {
        return Text("\(waterString)")
            .font(.largeTitle)
            .foregroundColor(Color.red)
        }else if water <= 100 {
        return Text("\(waterString)")
            .font(.largeTitle)
            .foregroundColor(Color.yellow)
        }else if water > 100 {
        return Text("\(waterString)")
                .font(.largeTitle)
                .foregroundColor(Color.green)
        }
        return Text("\(waterString)")
    }
    
    func plusOne(displayWater: Int) {
        self.water = displayWater+1
    }
    
    func minusOne(displayWater: Int) {
        self.water = displayWater-1
    }
    
    func addWaterDaily(waterDisplay: Int) {
        self.water = self.water+waterDisplay
        //This will help when the app closes in the background the app will remember the amount of water.
        UserDefaults.standard.set(self.water, forKey: "water")
    }
    
    func resetButton() {
        self.water = 0
    }
    
}

class waterRecord: ObservableObject {
    
}

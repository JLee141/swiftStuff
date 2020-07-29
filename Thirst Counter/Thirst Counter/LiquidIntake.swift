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
    @Published var water: Int
    //var dailyLiquid: Int
    var waterRecorededDaily:[Int] = []
    var waterGoal: Int
    init(water: Int) {
        self.water = water
        self.waterRecorededDaily.append(water)
        self.waterGoal = 135
    }
    
    func dailyWaterDisplay() -> String {
        let dailyWaterString = "\(water)"
        return dailyWaterString
    }
    
    func plusOne(displayWater: Int) {
        self.water = displayWater+1
    }
    
    func minusOne(displayWater: Int) {
        self.water = displayWater-1
    }
    
    func addWaterDaily(waterDisplay: Int) {
        self.water = self.water+waterDisplay
    }
    
}

class waterRecord: ObservableObject {
    
}

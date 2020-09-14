//
//  ContentView.swift
//  Healthkit Practice
//
//  Created by Jordan Lee on 8/23/20.
//  Copyright © 2020 Jordan Lee. All rights reserved.
//

import SwiftUI
import HealthKit

func fetchHealthData() -> Void {
    _ = HKHealthStore()
    
    if(HKHealthStore.isHealthDataAvailable()) {
         //rest of the code will be here
        let readData = Set([
                HKObjectType.quantityType(forIdentifier: .heartRate)!
        ])
        } else {
        Text("No healthkit data available")
    }
}

struct ContentView: View {
    @State var title = "Hello"
    
    var body: some View {
        Button(action: fetchHealthData) {
            Text("HealthKit Button")
            .font(.largeTitle)
            .bold()
            .foregroundColor(.white)

        }
        .frame(width: 350, height: 150)
        .background(Color.black)
        .cornerRadius(40)
        .border(Color.black)
        .cornerRadius(40)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

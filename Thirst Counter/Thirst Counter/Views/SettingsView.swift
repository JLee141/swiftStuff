//
//  SettingsView.swift
//  Thirst Counter
//
//  Created by Jordan Lee on 9/22/20.
//  Copyright © 2020 Jordan Lee. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @State var userInput = ""
    @State var number = 1
    
    var body: some View {
        NavigationView {
            List {
                Text("Hello")
                Stepper(value: $number, in: 1...200) {
                    Text("Amount of OZ: \(number)")
                }

            }
        }
        .navigationBarTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

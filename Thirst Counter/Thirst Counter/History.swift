//
//  History.swift
//  Thirst Counter
//
//  Created by Jordan Lee on 7/23/20.
//  Copyright © 2020 Jordan Lee. All rights reserved.
//

import SwiftUI
struct History: View {
    @State var Dates = Date()
    //@State var waterHistory: Liquid
    var body: some View {
        NavigationView {
            List {
                Section {
                    Text("Monday | ")
                    Text("Tuesday")
                    Text("Wednesday")
                    Text("Thursday")
                    Text("Friday")
                    Text("Saturday")
                    Text("Sunday")
                }
            }
        }.navigationBarTitle("Liquid History")
            
 }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}


//
//  ContentView.swift
//  Thirst Counter
//
//  Created by Jordan Lee on 3/9/21.
//  Copyright © 2021 Jordan Lee. All rights reserved.
//

import SwiftUI
import iPages

struct ContentView: View {
    @State var currentPage: Int = 0
    @EnvironmentObject var userWater: Liquid
    
    var body: some View {
        iPages {
            MainPage()
            LiquidChooseView()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

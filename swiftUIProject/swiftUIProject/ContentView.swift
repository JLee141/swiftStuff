//
//  ContentView.swift
//  swiftUIProject
//
//  Created by Jordan Lee on 5/1/20.
//  Copyright © 2020 Jordan Lee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var head: some View {
        VStack(alignment: .leading) {
            Text("Hello! What would you like to do?").font(.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

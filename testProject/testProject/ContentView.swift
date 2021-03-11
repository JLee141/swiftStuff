//
//  ContentView.swift
//  testProject
//
//  Created by Jordan Lee on 3/23/20.
//  Copyright © 2020 Jordan Lee. All rights reserved.
//

import SwiftUI
let textList = ["This", "is", "A", "test", "list"]
let nameList = ["Jordan","Cal","Nick","Danielle","Robert","Ariel","Camilo"]
let liquidList = ["Water","Coffee"]

struct ContentView: View {
    @State var displayWord = "Select A Word"
    @State var displayNumber = 0
    var wordSelect = ""
    @State var button = false
    @State var activateView = false
    
    var body: some View {
        VStack {
            Text("Liquids")
                .font(.title)
            Spacer()
            
            HStack {
                Spacer()
                ForEach(0..<2) { _ in
                    Button(action: {
                        activateView.toggle()
                    }){
                        RoundedRectangle(cornerRadius: 40)
                            .size(width: 140, height: 140)
                            .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                            .padding()
                    }
                }
            }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
        }
    }
}

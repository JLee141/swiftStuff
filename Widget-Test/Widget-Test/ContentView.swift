//
//  ContentView.swift
//  Widget-Test
//
//  Created by Jordan Lee on 7/8/20.
//  Copyright © 2020 Jordan Lee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = [Emoji(icon:"😀", name: "Happy", description: "This means the user is about that life!")
    ]
    var body: some View {
        VStack{
        Text("This is a vStack")
        }
        Text("Hello, World!")
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

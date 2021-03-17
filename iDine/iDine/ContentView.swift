//
//  ContentView.swift
//  iDine
//
//  Created by Jordan Lee on 3/3/21.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(menu) { section in
                    Text(section.name)
                    
                    ForEach(section.items) { item in
                        Text(item.name)
                    }
                }
            }
            //.navigationTitle("Menu")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

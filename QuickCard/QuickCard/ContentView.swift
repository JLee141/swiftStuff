//
//  ContentView.swift
//  QuickCard
//
//  Created by Jordan Lee on 9/9/20.
//  Copyright © 2020 Jordan Lee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: labelView()){
                    Text("Press Me :)")
                }
        ZStack {
            
            Rectangle()
                .fill(Color("CardBackground"))
                .frame(width: 300, height: 200)
                .cornerRadius(20)
                .shadow(radius: 10)
            
            VStack(alignment: .leading) {
                
                Text("Jordan Lee")
                    .font(.title)
                Text("Amateur Software Engineer 🧑🏽‍💻")
                    .italic()
                Spacer()
                HStack {
                    Image(systemName: "envelope.fill")
                        .foregroundColor(.blue)
                    Text("JLee@Tecintl.com")
                }
                
                HStack {
                    Image(systemName: "link")
                        .foregroundColor(.blue)
                    Text("JLee.Me")
                }
                
                HStack {
                    Image(systemName: "location.fill")
                        .foregroundColor(.blue)
                    Text("Pembroke Pines, Florida")
                    
                }
                
            }.padding()
            .foregroundColor(Color("TextBackground"))
                }.frame(width: 300, height: 200)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

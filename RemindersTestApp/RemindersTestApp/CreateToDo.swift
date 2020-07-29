//
//  CreateToDo.swift
//  pluralSightTestProject
//
//  Created by Jordan Lee on 7/23/20.
//  Copyright © 2020 Jordan Lee. All rights reserved.
//

import SwiftUI

struct CreateToDo: View {
    
    @State var toDoTitle = ""
    @State var important = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var toDoStorage: ToDoStorage
    var body: some View {
        List {
            Section {
                TextField("Ex. Walk the Dog", text: $toDoTitle)
            }
            Section {
                Toggle(isOn: $important){
                Text("Important")
                }
            }
            Section {
                HStack{
                    Spacer()
                Button("Save") {
                    self.toDoStorage.toDos.append(ToDoItem(title: self.toDoTitle, important: self.important))
                    self.presentationMode.wrappedValue.dismiss()
                }.disabled(toDoTitle.isEmpty)
                    Spacer()
                }
            }
        }.listStyle(GroupedListStyle())
    }
}

struct CreateToDo_Previews: PreviewProvider {
    static var previews: some View {
        CreateToDo().environmentObject(ToDoStorage())
    }
}

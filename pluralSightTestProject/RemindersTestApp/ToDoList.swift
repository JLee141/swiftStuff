//
//  ContentView.swift
//  pluralSightTestProject
//
//  Created by Jordan Lee on 7/20/20.
//  Copyright © 2020 Jordan Lee. All rights reserved.
//

import SwiftUI
struct ToDoList: View {
    @EnvironmentObject var toDoStorage: ToDoStorage
    
    var body: some View {
        
        NavigationView{
            
            List {
                ForEach(self.toDoStorage.toDos) {
                    todo in if todo.important {
                        Text(todo.title).bold().foregroundColor(.black).background(Rectangle()).foregroundColor(.red).cornerRadius(5, antialiased: true)
                    } else {
                        Text(todo.title)
                    }
                }.onDelete(perform: {
                    indexSet in if let index = indexSet.first {
                        self.toDoStorage.toDos.remove(at: index)
                    }
                })
        
                //            Text("Wash the car 🚗")
                //            Text("Fold clothes 👕")
                //            Text("Organize desk")
                //            Text("Say hello to everyone! 👋🏼")
            }.navigationBarTitle("To Do List").navigationBarItems(trailing: NavigationLink(destination: CreateToDo()){
                Text("Add")
            })
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoList().environmentObject(ToDoStorage())
    }
}

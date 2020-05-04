//
//  ReminderView.swift
//  BeCare
//
//  Created by Giovanni Prisco on 22/04/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import SwiftUI
import CoreData

struct ReminderView: View {
    @Environment(\.managedObjectContext) var context
    @State var addReminder = false
    var data: FetchedResults<Reminder>
    
    var plusButton: some View {
        Button(action: { self.addReminder.toggle() }) {
            Image(systemName: "plus")
                .imageScale(.large)
                .accessibility(label: Text("Add Reminder"))
                .padding()
        }
    }
    
    func handleDelete(indexSet: IndexSet) {
        let itemToDelete = self.data[indexSet.first!]
        self.context.delete(itemToDelete)
        
        do {
            try self.context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                CategoryHeader(categoryImage: "drop.triangle.fill", categoryName: "Motor Oil Change")
                ForEach(data.filter({ $0.category == "Motor Oil Change" })) { reminder in
                    ReminderRow(reminder: reminder)
                }.onDelete(perform: { indexSet in self.handleDelete(indexSet: indexSet) })
                
                CategoryHeader(categoryImage: "largecircle.fill.circle", categoryName: "Tire Change")
                ForEach(data.filter({ $0.category == "Tire Change" })) { reminder in
                    ReminderRow(reminder: reminder)
                }.onDelete(perform: { indexSet in self.handleDelete(indexSet: indexSet) })
                
                CategoryHeader(categoryImage: "rectangle.fill.on.rectangle.angled.fill", categoryName: "Insurance")
                ForEach(data.filter({ $0.category == "Insurance" })) { reminder in
                    ReminderRow(reminder: reminder)
                }.onDelete(perform: { indexSet in self.handleDelete(indexSet: indexSet) })
            }
            .navigationBarTitle(Text("Reminder"))
            .navigationBarItems(trailing: plusButton)
            .sheet(isPresented: $addReminder) {
                AddReminder(showModal: self.$addReminder).environment(\.managedObjectContext, self.context)
            }
            .onAppear(perform: {
                UITableView.appearance().separatorColor = .clear
            })
        }
    }
}

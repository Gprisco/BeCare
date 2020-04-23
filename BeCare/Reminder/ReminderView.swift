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
    
    var body: some View {
        NavigationView {
            //Completare seguendo lo sketch, manca l'immagine veicolo in alto
            //Lista da sistemare, filtrare i reminder per categoria, seguire lo sketch
            List {
                ForEach(data) { reminder in
                    Text(reminder.name!)
                }.onDelete(perform: { indexSet in
                    let itemToDelete = self.data[indexSet.first!]
                    self.context.delete(itemToDelete)
                    
                    do {
                        try self.context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                })
            }
            .navigationBarTitle(Text("Reminder"))
            .navigationBarItems(trailing: plusButton)
            .sheet(isPresented: $addReminder) {
                AddReminder(showModal: self.$addReminder).environment(\.managedObjectContext, self.context)
            }
        }
    }
}

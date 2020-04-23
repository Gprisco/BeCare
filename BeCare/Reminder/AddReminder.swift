//
//  AddReminder.swift
//  MoCar
//
//  Created by Giovanni Prisco on 15/11/2019.
//  Copyright © 2019 Giovanni Prisco. All rights reserved.
//

import SwiftUI
import CoreData
import UserNotifications

struct AddReminder: View {
    @Environment(\.managedObjectContext) var context
    @Binding var showModal: Bool

    var selections = ["Motor Oil Change", "Tire Change", "Insurance", "Checkup", "License", "Other"]

    @State private var reminderType = 0
    @State private var name = ""
    @State private var expiration = Date()
    @State private var deadline_km: Int? = nil
    
    func addReminder(reminderType: String, deadline_km: Int, deadline_date: Date, name: String?) {
        let reminder = Reminder(context: context)
        reminder.category = reminderType
        reminder.deadline_km = Int32(deadline_km)
        reminder.deadline_date = deadline_date
        reminder.name = name ?? ""
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    //The Save Button that has to be shown on top right (navigation bar)
    var save: some View {
        Button(action: {
            self.addReminder(reminderType: self.selections[self.reminderType], deadline_km: self.deadline_km ?? -1, deadline_date: self.expiration, name: self.name)
            self.showModal.toggle()
        }) {
            Text("Save")
                .font(.callout)
                .fontWeight(.semibold)
        }
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker(selection: $reminderType, label: Text("Reminder Type")) {
                        ForEach(0 ..< selections.count) { i in
                            Text(self.selections[i]).tag(i)
                        }
                    }
                }
                
                if(self.selections[reminderType] == "Other") {
                    Section {
                        TextField("Name", text: $name)
                    }
                }
                
                if(self.reminderType == 0 || self.reminderType == 1) {
                    Section {
                        TextField("Kilometers", value: $deadline_km, formatter: NumberFormatter())
                    }
                } else {
                    Section {
                        DatePicker(selection: $expiration, in: Date()..., displayedComponents: .date) {
                            Text("Deadline")
                        }
                    }
                }
            }
            .navigationBarTitle("Add a Reminder", displayMode: .inline)
            .navigationBarItems(trailing: save)
        }
        .accentColor(Color(.sRGB, red: 1.0, green: 0.7, blue: 0.0, opacity: 1.0))
    }
}

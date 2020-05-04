//
//  ReminderSection.swift
//  BeCare
//
//  Created by Giovanni Prisco on 04/05/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import SwiftUI

struct ReminderRow: View {
    var reminder: Reminder
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 100.0, height: 100.0), style: .circular).foregroundColor(Color(red: 250/255, green: 214/255, blue: 79/255))
            
            HStack {
                Text(
                    "\(reminder.name! != "" ? reminder.name! : reminder.category!) - \(reminder.deadline_km != -1 ? String(reminder.deadline_km) : showDate(date: reminder.deadline_date!))"
                )
                Spacer()
            }
            .multilineTextAlignment(.leading)
            .padding(20)
        }
    }
}

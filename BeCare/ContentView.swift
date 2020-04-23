//
//  ContentView.swift
//  BeCare
//
//  Created by Giovanni Prisco on 22/04/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @State private var selection = 0
    
    @State var alreadyLaunched: Bool
    @State var isAuth: Bool = false
    @State var authFailed: Bool = false
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Reminder.loadRemindersFromFetchRequest()) var reminderData: FetchedResults<Reminder>
    @FetchRequest(fetchRequest: Trip.loadTripsFromFetchRequest()) var tripData: FetchedResults<Trip>

    var body: some View {
        ZStack(alignment: .leading) {
            if !self.isAuth {
                if !self.alreadyLaunched {
                    OnBoardingView(alreadyLaunched: self.$alreadyLaunched)
                }
                else {
                    TabView(selection: $selection) {
                        ReminderView(data: self.reminderData).environment(\.managedObjectContext, managedObjectContext)
                            .tabItem {
                                VStack {
                                    Image(systemName: "calendar")
                                    Text("Reminder")
                                }
                        }
                        .tag(0)
                        ReportView()
                            .tabItem {
                                VStack {
                                    Image(systemName: "function")
                                    Text("Report")
                                }
                        }
                        .tag(1)
                    }
                }
            }
        }
        .accentColor(Color(.sRGB, red: 1.0, green: 0.7, blue: 0.0, opacity: 1.0))
        .onAppear(perform: {
            let context = LAContext()
            var error: NSError?

            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Identify yourself!"

                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                    DispatchQueue.main.async {
                        if success {
                            self.isAuth.toggle()
                        } else {
                            self.authFailed.toggle()
                        }
                    }
                }
            }
        })
        .alert(isPresented: self.$authFailed) {
            Alert(title: Text("Authentication Failed"), message: Text("Please add some biometrics!"), dismissButton: .default(Text("Got it!")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(alreadyLaunched: false)
    }
}

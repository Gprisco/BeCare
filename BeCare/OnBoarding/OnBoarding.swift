//
//  ContentView.swift
//  OnBoarding
//
//  Created by Giovanni Prisco on 14/11/2019.
//  Copyright © 2019 Giovanni Prisco. All rights reserved.
//

import SwiftUI

struct OnBoardingView: View {
    @State var currentPageIndex = 0
    @Binding var alreadyLaunched: Bool

    var subviews = [
        UIHostingController(rootView: Subview(
            imageString: "reminder",
            title: "NEVER FORGET ABOUT\nYOUR CAR MAINTENANCE",
            description: "Add reminders for your maintenance stuff.")),
        UIHostingController(rootView: Subview(
            imageString: "report",
            title: "KEEP TRACK\nOF YOUR CAR USAGE",
            description: "Visualize data about your trips.")),
        UIHostingController(rootView: Subview(
            imageString: "sumup",
            title: "TAKE CARE\nOF YOUR CAR",
            description: ""))
    ]

    var body: some View {
        VStack {
            PageViewController(currentPageIndex: $currentPageIndex, controllers: subviews)
                .frame(height: 600)
                .padding(.top, 15)

            HStack(alignment: .center, spacing: 50) {
                PageDotView(currentPageIndex: $currentPageIndex, numberOfPages: self.subviews.count)
                    .padding(.horizontal, 25)
                    .padding(.top, 15)
                    .fixedSize()

                Spacer()

                Button(action: {
                    self.alreadyLaunched.toggle()

                    UserDefaults().set(true, forKey: "alreadyLaunched")
                }) {
                    HStack {
                        if self.currentPageIndex == (self.subviews.count - 1) {
                            Text("Let's Start!")
                                .font(.system(.headline, design: .rounded))
                                .fontWeight(.regular)
                                .padding(.horizontal, 20)
                                .padding(.top, 10)
                        }
                        else {
                            Text("")
                                .font(.system(.headline, design: .rounded))
                                .fontWeight(.regular)
                        }
                    }
                }
            }.padding(.bottom, 15)
        }
    }
}

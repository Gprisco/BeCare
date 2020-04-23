//
//  Subview.swift
//  OnBoarding
//
//  Created by Giovanni Prisco on 14/11/2019.
//  Copyright © 2019 Giovanni Prisco. All rights reserved.
//

import SwiftUI

struct Subview: View {
    var imageString: String
    var title: String
    var description: String

    var body: some View {
        VStack(alignment: .center) {
            Text(title)
                .font(.system(size: 20, weight: .black, design: .rounded))
                .multilineTextAlignment(.center)
                .padding(.top, 15)
            
            Image(imageString)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipped()

            if description != "" {
                Text(description)
                    .font(.system(.headline, design: .rounded))
                    .fontWeight(.regular)
                    .padding(.bottom, 15)
            }
        }
    }
}

struct Subview_Previews: PreviewProvider {
    static var previews: some View {
        Subview(imageString: "reminder", title: "NEVER FORGET ABOUT\nYOUR CAR MAINTENANCE", description: "Add reminders for your maintenance stuff.")
    }
}

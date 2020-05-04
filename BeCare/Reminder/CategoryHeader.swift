//
//  CategoryHeader.swift
//  BeCare
//
//  Created by Giovanni Prisco on 04/05/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import SwiftUI

struct CategoryHeader: View {
    var categoryImage: String
    var categoryName: String
    
    var body: some View {
        HStack {
            Image(systemName: categoryImage)
                .aspectRatio(1, contentMode: .fill)
            
            Text(categoryName)
                .fontWeight(.semibold)
                .padding(.horizontal, 10)
            
            Spacer()
            
            Text("See all")
        }
        .padding(.horizontal, 10)
    }
}

struct CategoryHeader_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHeader(categoryImage: "drop.triangle.fill", categoryName: "Motor Oil Change")
    }
}

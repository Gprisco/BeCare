//
//  PageDotView.swift
//  MoCar
//
//  Created by Giovanni Prisco on 21/11/2019.
//  Copyright © 2019 Giovanni Prisco. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct PageDotView: UIViewRepresentable {
    @Binding var currentPageIndex: Int
    
    var numberOfPages: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.pageIndicatorTintColor = .gray
        control.currentPageIndicatorTintColor = UIColor(red: 1.0, green: 0.8, blue: 0.0, alpha: 1.0)
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = self.currentPageIndex
    }
}

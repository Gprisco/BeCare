//
//  Helpers.swift
//  MoCar
//
//  Created by Giovanni Prisco on 20/11/2019.
//  Copyright © 2019 Giovanni Prisco. All rights reserved.
//

import Foundation

extension Date {
    func isBetween(_ date1: Date, and date2: Date) -> Bool {
        return (min(date1, date2) ... max(date1, date2)) ~= self
    }
}

func showDate(date: Date) -> String {
    let dateFormatter = DateFormatter()

    dateFormatter.dateFormat = "dd/MM/yyyy"

    return dateFormatter.string(from: date)
}

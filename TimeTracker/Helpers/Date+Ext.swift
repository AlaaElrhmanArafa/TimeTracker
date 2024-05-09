//
//  Date+Ext.swift
//  TimeTracker
//
//  Created by AlaaElrhman on 18/03/2024.
//

import SwiftUI

extension Date {
    func format(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string (from: self)
    }
}

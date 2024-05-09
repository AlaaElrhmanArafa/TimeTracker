//
//  Image+Ext.swift
//  TimeTracker
//
//  Created by AlaaElrhman Arafa on 08/05/2024.
//

import Foundation
import SwiftUI
import UIKit

extension Image {
    init?(data: Data) {
        guard let uiImage = UIImage(data: data) else { return nil }
        self = Image(uiImage: uiImage)
    }
}

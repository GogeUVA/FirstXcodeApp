//
//  Task.swift
//  FirstApp
//
//  Created by George Yao on 6/3/26.
//

import Foundation
import SwiftData

@Model
class Task {
    var title: String
    var isCompleted: Bool = false
    
    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}

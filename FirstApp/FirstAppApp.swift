//
//  FirstAppApp.swift
//  FirstApp
//
//  Created by George Yao on 6/2/26.
//

import SwiftUI
import SwiftData

@main
struct FirstAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}

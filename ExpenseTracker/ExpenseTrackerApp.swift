//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Muhammet Emin AYHAN on 13.09.2024.
//

import SwiftUI
import WidgetKit

@main
struct ExpenseTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    WidgetCenter.shared.reloadAllTimelines()
                }
        }
        .modelContainer(for: [Transaction.self])
    }
}

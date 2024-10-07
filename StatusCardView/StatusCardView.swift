//
//  StatusCardView.swift
//  StatusCardView
//
//  Created by Muhammet Emin AYHAN on 18.09.2024.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> WidgetEntry {
        WidgetEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (WidgetEntry) -> ()) {
        let entry = WidgetEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [WidgetEntry] = []

        entries.append(.init(date: .now))
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct WidgetEntry: TimelineEntry {
    let date: Date
}

struct StatusCardViewEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        FilterTransactionsView(startDate: .now.startOfMonth, endDate: .now.endOfMonth) { transactions in
            CardView(income: total(transactions, category: .income),
                     expense: total(transactions, category: .expense))
        }
    }
}

struct StatusCardView: Widget {
    let kind: String = "StatusCardView"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            StatusCardViewEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
                .modelContainer(for: Transaction.self)
        }
        .supportedFamilies([.systemMedium])
        .contentMarginsDisabled()
        .configurationDisplayName("Widget")
        .description("Bu bir örnek widget'tır.")
    }
}

#Preview(as: .systemSmall) {
    StatusCardView()
} timeline: {
    WidgetEntry(date: .now)
}

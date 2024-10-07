//
//  DateFilterView.swift
//  ExpenseTracker
//
//  Created by Muhammet Emin AYHAN on 14.09.2024.
//

import SwiftUI

struct DateFilterView: View {
    @State var start: Date
    @State var end: Date
    var onSubmit: (Date, Date) -> ()
    var onClose: () -> ()
    var body: some View {
        VStack(spacing: 10) {
            DatePicker("Başlangıç ​​Tarihi", selection: $start, displayedComponents: [.date])
            
            DatePicker("Bitiş ​​Tarihi", selection: $end, displayedComponents: [.date])
            
            HStack(spacing: 15) {
                Button("İptal") {
                    onClose()
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 5))
                .tint(.red)
                
                Button("Filtrele") {
                    onSubmit(start, end)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 5))
                .tint(appTint)
            }
            .padding(.top, 10)
        }
        .padding(15)
        .background(.bar, in: .rect(cornerRadius: 10))
        .padding(.horizontal, 30)
    }
}


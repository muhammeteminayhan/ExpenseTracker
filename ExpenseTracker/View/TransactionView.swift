//
//  NewExpenseView.swift
//  ExpenseTracker
//
//  Created by Muhammet Emin AYHAN on 17.09.2024.
//

import SwiftUI
import WidgetKit

struct TransactionView: View {
    // Env Properties
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    var editTransaction: Transaction?
    // View Properties
    @State private var title: String = ""
    @State private var remarks: String = ""
    @State private var amount: Double = .zero
    @State private var dateAdded: Date = .now
    @State private var category: Category = .expense
    // Random Color
    @State var tint: TintColor = tints.randomElement()!
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 15) {
                Text("Önizleme")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .hSpacing(.leading)
                // Preview Transaction Card View
                TransactionCardView(transaction: .init(
                    title: title.isEmpty ? "Başlık" : title,
                    remarks: remarks.isEmpty ? "Notlar" : remarks,
                    amount: amount,
                    dateAdded: dateAdded,
                    category: category,
                    tintColor: tint))
                CustomSection("Başlık", "Kalem", value: $title)
                CustomSection("Remarks", "Kırtasiye Alışverişi", value: $remarks)
                
                // Amount & Category Check Box
                VStack(alignment: .leading, spacing: 10) {
                    Text("Miktar ve Kategori")
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .hSpacing(.leading)
                    HStack(spacing: 15) {
                        HStack(spacing: 4) {
                            Text(currencySymbol)
                                .font(.callout.bold())
                            
                            TextField("0.0", value: $amount, formatter: numberFormatter)
                                .keyboardType(.decimalPad)
                        }
                        
                        .padding(.horizontal, 15)
                        .padding(.vertical, 12)
                        .background(.background, in: .rect(cornerRadius: 10))
                        .frame(maxWidth: 130)
                            
                        
                        // Custom Check Box
                        CategoryCheckBox()
                    }
                }
                
                // Date Picker
                VStack(alignment: .leading, spacing: 10) {
                    Text("Tarih")
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .hSpacing(.leading)
                    
                    DatePicker("", selection: $dateAdded, displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 12)
                        .background(.background, in: .rect(cornerRadius: 10))
                }
            }
            .padding(15)
        }
        .navigationTitle(" Transaction \(editTransaction == nil ? "Ekle" : "Düzenle")")
        .background(.gray.opacity(0.15))
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Kaydet", action: save)
            }
        })
        .onAppear(perform: {
            if let editTransaction {
                // Load All Existing Data From the Transaction
                title = editTransaction.title
                remarks = editTransaction.remarks
                dateAdded = editTransaction.dateAdded
                if let category = editTransaction.rawCategory {
                    self.category = category
                }
                amount = editTransaction.amount
                if let tint = editTransaction.tint {
                    self.tint = tint
                }
            }
        })
    }
    
    // Saving Data
    func save() {
        // Saving Item to SwiftData
        if editTransaction != nil {
            editTransaction?.title = title
            editTransaction?.remarks = remarks
            editTransaction?.amount = amount
            editTransaction?.category = category.rawValue
            editTransaction?.dateAdded = dateAdded
        } else {
            let transaction = Transaction(title: title, remarks: remarks, amount: amount, dateAdded: dateAdded, category: category, tintColor: tint)
            context.insert(transaction)
        }
        
        // Dismissing View
        dismiss()
        WidgetCenter.shared.reloadAllTimelines()
    }
    @ViewBuilder
    func CustomSection(_ title: String,_ hint: String, value: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.title)
                .foregroundStyle(.gray)
                .hSpacing(.leading)
            TextField(hint, text: value)
                .padding(.horizontal, 15)
                .padding(.vertical, 12)
                .background(.background, in: .rect(cornerRadius: 10))
        }
    }
    
    // Custom Checkbox
    @ViewBuilder
    func CategoryCheckBox() -> some View {
        HStack(spacing: 10) {
            ForEach(Category.allCases, id: \.rawValue) { category in
                HStack(spacing: 5) {
                    ZStack {
                        Image(systemName: "circle")
                            .font(.title3)
                            .foregroundStyle(appTint)
                        
                        if self.category == category {
                            Image(systemName: "circle.fill")
                                .font(.caption)
                                .foregroundStyle(appTint)
                        }
                    }
                    
                    Text(category.rawValue)
                        .font(.caption)
                }
                .contentShape(.rect)
                .onTapGesture {
                    self.category = category
                }
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 12)
        .hSpacing(.leading)
        .background(.background, in: .rect(cornerRadius: 10))
    }
    
    // Number Formatter
    var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }
}

#Preview {
    NavigationStack {
        TransactionView()
    }
    
}

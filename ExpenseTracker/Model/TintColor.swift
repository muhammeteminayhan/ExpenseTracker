//
//  TintColor.swift
//  ExpenseTracker
//
//  Created by Muhammet Emin AYHAN on 13.09.2024.
//

import SwiftUI

struct TintColor: Identifiable {
    let id: UUID = .init()
    let color: String
    let value: Color
}
var tints: [TintColor] = [
    .init(color: "Red", value: .red),
    .init(color: "Blue", value: .blue),
    .init(color: "Pink", value: .pink),
    .init(color: "Purple", value: .purple),
    .init(color: "Brown", value: .brown),
    .init(color: "Orange", value: .orange)
]


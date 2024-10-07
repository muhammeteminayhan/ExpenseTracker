//
//  Tab.swift
//  ExpenseTracker
//
//  Created by Muhammet Emin AYHAN on 13.09.2024.
//

import SwiftUI

enum Tab: String{
    case recents = "Geçmiş"
    case search = "Filtre"
    case charts = "Grafikler"
    case settings = "Ayarlar"
    
    @ViewBuilder
    var tabContent: some View {
        switch self {
        case .recents:
            Image(systemName: "calendar")
            Text(self.rawValue)
        case .search:
            Image(systemName: "magnifyingglass")
            Text(self.rawValue)
        case .charts:
            Image(systemName: "chart.bar.fill")
            Text(self.rawValue)
        case .settings:
            Image(systemName: "gearshape")
            Text(self.rawValue)
        
        }
    }
}

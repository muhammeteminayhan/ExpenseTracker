//
//  Settings.swift
//  ExpenseTracker
//
//  Created by Muhammet Emin AYHAN on 13.09.2024.
//

import SwiftUI

struct Settings: View {
    // User Properties
    @AppStorage("userName") private var userName: String = ""
    // App Lock Properties
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = false
    @AppStorage("lockWhenAppGoesBackground") private var lockWhenAppGoesBackground: Bool = false
    var body: some View {
        NavigationStack {
            List {
                Section("Kullanıcı Adı") {
                    TextField("Battal Gazi", text: $userName)
                }
                Section("Uygulama Kilidi") {
                    Toggle("Uygulama Kilidini Etkinleştir", isOn: $isAppLockEnabled)
                    
                    if isAppLockEnabled {
                        Toggle("Uygulama Arka Plana Geçtiğinde Kilitle", isOn: $lockWhenAppGoesBackground )
                    }
                }
            }
            
        }
        .navigationTitle("AYARLAR")
    }
}

#Preview {
    Settings()
}

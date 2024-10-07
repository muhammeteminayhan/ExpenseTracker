//
//  IntroScreen.swift
//  ExpenseTracker
//
//  Created by Muhammet Emin AYHAN on 13.09.2024.
//

import SwiftUI

struct IntroScreen: View {
    /// Visiibility Status
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    var body: some View {
        VStack(spacing: 15) {
            Text("What's New in the\nExpense Tracker")
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
                .padding(.top, 65)
                .padding(.bottom,35)
            // point View
            VStack(alignment: .leading, spacing: 25, content: {
                pointView(symbol: "dollarsign", title: "Transactions", subTitle: "Kazancınızı ve harcamalarınızı takip edin.")
                pointView(symbol: "chart.bar.fill", title: "Visual Charts", subTitle: "İşlemlerinizi göz alıcı grafik gösterimlerle görüntüleyin.")
                pointView(symbol: "magnifyingglass", title: "Advance Filters", subTitle: "Gelişmiş arama ve filtreleme ile istediğiniz harcamaları bulun")
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 15)
            
            Spacer(minLength: 10)
            
            Button(action: {
                isFirstTime = false
            }, label: {
                Text("Devam")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(appTint.gradient, in: .rect(cornerRadius: 12))
                    .contentShape(.rect)
            })
        }
        .padding(15)
    }
     /// Point View
    @ViewBuilder
    func pointView(symbol: String, title: String, subTitle: String) -> some View {
        HStack(spacing: 20){
            Image(systemName: symbol)
                .font(.largeTitle)
                .foregroundStyle(appTint.gradient)
                .frame(width: 45)
            VStack(alignment: .leading, spacing: 6, content: {
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(subTitle)
                    .foregroundStyle(.gray)
            })
        }

    }
}

#Preview {
    IntroScreen()
}

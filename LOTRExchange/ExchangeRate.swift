//
//  ExchangeRate.swift
//  LOTRExchange
//
//  Created by Masume Çetin on 6.11.2024.
//

import Foundation
import SwiftUI

struct ExchangeRateView: View {
    let leftImage : ImageResource
    let rightImage : ImageResource
    let exchangeText : String
    
    var body: some View {
        HStack{
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 30)
            Text(exchangeText)
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 30)
        }
    }
}

#Preview {
    ExchangeRateView(leftImage: .silverpiece, rightImage: .copperpenny, exchangeText: "1 gold piece = to 4 gold pennies")
}

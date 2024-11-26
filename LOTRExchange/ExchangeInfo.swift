//
//  ExchangeInfo.swift
//  LOTRExchange
//
//  Created by Masume Çetin on 6.11.2024.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismissSheet
    
    var body: some View {
        ZStack{
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
            VStack{
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(2)
                    .padding()
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()
             
                ExchangeRateView(leftImage: .goldpiece, rightImage: .goldpenny, exchangeText: "1 gold piece = to 4 gold pennies")
                ExchangeRateView(leftImage: .goldpenny, rightImage: .silverpiece, exchangeText: "1 gold penny = to 4 silver pieces")
                ExchangeRateView(leftImage: .silverpiece, rightImage: .silverpenny, exchangeText: "1 silver piece = to 4 silver pennies")
                ExchangeRateView(leftImage: .silverpenny, rightImage: .copperpenny, exchangeText: "1 silver piece = to 100 gold pennies")
             
                Button("Done"){
                    dismissSheet()
                }.buttonStyle(.borderedProminent)
                    .tint(.brown)
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding()
            }.foregroundStyle(.black)
        }.background(.black.opacity(0.7))
    }
}

#Preview {
    ExchangeInfo()
}


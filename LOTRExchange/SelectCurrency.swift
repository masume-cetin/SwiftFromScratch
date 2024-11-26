//
//  SelectCurrency.swift
//  LOTRExchange
//
//  Created by Masume Çetin on 6.11.2024.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismissSheet
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    var body: some View {
        ZStack{
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                Text("select the currency you starting with:")
                    .fontWeight(.bold)
                IconGrid(currency: $topCurrency)
            
                Text("select the currency you would like to convert to:")
                    .fontWeight(.bold)
                
                IconGrid(currency: $bottomCurrency)
                
                
                Button("Done"){
                    dismissSheet()
                }.buttonStyle(.borderedProminent)
                    .tint(.brown)
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding()
            }.padding().multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency(topCurrency: .constant(.silverPiece), bottomCurrency: .constant(.silverPiece))
}

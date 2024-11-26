//
//  ContentView.swift
//  LOTRExchange
//
//  Created by Masume Çetin on 3.11.2024.
//

import SwiftUI
import TipKit

struct ContentView: View {
    
    @State var showexchangeInfo = false
    @State var showSelectCurrency = false
    @State var leftAmount = ""
    @State var rightAmount = ""
    @State var leftCurrency: Currency = .silverPenny
    @State var rightCurrency: Currency = .goldPiece
    @FocusState var leftTyping
    @FocusState var rightTyping
  
    
    var body: some View {
        
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack{
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                HStack{
                    VStack{
                        HStack{
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom,-5)
                        .onTapGesture {
                            showSelectCurrency = true
                        }
                        .popoverTip(CurrencyTip(),arrowEdge:.bottom)
                        TextField("Amount", text:   $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.leading)
                            .focused($leftTyping)
                            .keyboardType(.decimalPad)
                            
                    }
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    VStack{
                        HStack{
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom,-5)
                        .onTapGesture {
                            showSelectCurrency = true
                        }
                        TextField("Amount", text:   $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            .keyboardType(.decimalPad)
                            
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.rect)
                Spacer()
                HStack{
                    Spacer()
                    Button{
                        showexchangeInfo.toggle()
                        
                    }
                    label: {
                        Image(systemName : "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }.padding()
                    }
               
            
            }
            .onChange(of: leftAmount){
                if leftTyping == true{
                    rightAmount = leftCurrency.convert( leftAmount, to: rightCurrency)
                }
            }
            .task{
                try? Tips.configure()
            }
            .onChange(of: rightAmount){
                if rightTyping == true{
                    leftAmount = rightCurrency.convert( rightAmount, to: leftCurrency)
                }
            }
            .onChange(of: leftCurrency){
                leftAmount = rightCurrency.convert( rightAmount, to: leftCurrency)
            }
            .onChange(of: rightCurrency){
                rightAmount = leftCurrency.convert( leftAmount, to: rightCurrency)
            }
            .sheet(isPresented: $showSelectCurrency){
                SelectCurrency(topCurrency: $leftCurrency,bottomCurrency: $rightCurrency)
            }
            //.border(.white)
        }.sheet(isPresented: $showexchangeInfo){
            ExchangeInfo()
        }
    }
}

#Preview {
    ContentView()
}

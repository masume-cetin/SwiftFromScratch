//
//  Currency.swift
//  LOTRExchange
//
//  Created by Masume Çetin on 11.11.2024.
//
import SwiftUI
import Foundation

enum Currency : Double , CaseIterable , Identifiable{
    var id: Currency {
        self
    }
    
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    var image : ImageResource{
        switch self {
        case .copperPenny : .copperpenny
        case .silverPenny : .silverpenny
        case .silverPiece : .silverpiece
        case .goldPenny : .goldpenny
        case .goldPiece : .goldpiece
            
        }
    }
    var name : String{
        switch self{
        case .copperPenny : "Copper Penny"
        case .silverPenny : "Silver Penny"
        case .silverPiece : "Silver Piece"
        case .goldPenny : "Gold Penny"
        case .goldPiece : "Gold Piece"
            
        }
    }
    func convert(_ amountString : String,to currency: Currency) -> String {
        guard let doubleAmount = Double(amountString) else{
            return ""
        }
        let convertedAmount = (doubleAmount * self.rawValue) / currency.rawValue
        return String(format : "%.2f",convertedAmount)
    }
}


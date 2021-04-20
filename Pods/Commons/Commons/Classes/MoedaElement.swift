//
//  MoedaElement.swift
//  Commons
//
//  Created by Leonardo Oliveira Portes on 15/04/21.
//

import Foundation

   // MARK: MoedaElement 

public struct MoedaElement: Codable {
    public let assetID, name: String
    public let typeIsCrypto: Int
    public let dataStart, dataEnd, dataQuoteStart, dataQuoteEnd: String
    public let dataOrderbookStart, dataOrderbookEnd, dataTradeStart, dataTradeEnd: String
    public let dataSymbolsCount: Int
    public let volume1HrsUsd, volume1DayUsd, volume1MthUsd, priceUsd: Double
    public let idIcon: String

public enum CodingKeys: String, CodingKey {
        case assetID = "asset_id"
        case name
        case typeIsCrypto = "type_is_crypto"
        case dataStart = "data_start"
        case dataEnd = "data_end"
        case dataQuoteStart = "data_quote_start"
        case dataQuoteEnd = "data_quote_end"
        case dataOrderbookStart = "data_orderbook_start"
        case dataOrderbookEnd = "data_orderbook_end"
        case dataTradeStart = "data_trade_start"
        case dataTradeEnd = "data_trade_end"
        case dataSymbolsCount = "data_symbols_count"
        case volume1HrsUsd = "volume_1hrs_usd"
        case volume1DayUsd = "volume_1day_usd"
        case volume1MthUsd = "volume_1mth_usd"
        case priceUsd = "price_usd"
        case idIcon = "id_icon"
    }
}

public typealias Moeda = [MoedaElement]

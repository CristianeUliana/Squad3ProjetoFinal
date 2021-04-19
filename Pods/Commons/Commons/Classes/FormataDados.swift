//
//  File.swift
//  Commons
//
//  Created by Leonardo Oliveira Portes on 16/04/21.
//

import Foundation


    // MARK: - Tratamento da Data Atual : Esse retorno vai ser colocado no outlet da label da data

    public func mostrarDataAtual() -> String {

          let data = Date()
          let formatador = DateFormatter()
          formatador.dateFormat = "d MMM yyyy"
          let dataAtual = formatador.string(from: data)
          return dataAtual.lowercased()
        }


extension Double {

    public func formatador() -> String {
       
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.decimalSeparator = ","
        numberFormatter.groupingSeparator = "."
        let numero = NSNumber(value: self)
        let numeroFormatado = numberFormatter.string(from: numero) ?? ""
        return "$ \(numeroFormatado)"
    }

}

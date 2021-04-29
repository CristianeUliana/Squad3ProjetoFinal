//
//  Request.swift
//  ProjetoFinalSquad3
//
//  Created by Cristiane Goncalves Uliana on 20/04/21.
//

import Foundation
import Commons


class Request {
    
    // MARK: - Variáveis
    
    var listaDeMoedas: [Criptomoeda] = []
    let tratamentoRequest = TratamentoRequest()
    
    
    // MARK: - RequestTelaPrincipal
    
    func makeRequestTelaPrincipal(completion:@escaping([Criptomoeda]) -> Void) {
            let url = URL(string: "https://rest.coinapi.io/v1/assets?apikey=1F8A5E86-F1C9-41C7-B8BB-9DB1B81FDE7C")!
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                print(response as Any)
                guard let responseData = data else { return }
                do {
                    let moedas = try JSONDecoder().decode(Moedas.self, from: responseData)
                    var moedaFiltrada = moedas.filter {$0.typeIsCrypto == 1 && $0.priceUsd ?? 0>0 && (($0.idIcon?.isEmpty) != nil)}
                    for i in 0...(moedaFiltrada.count-1) {
                        guard let sigla = moedaFiltrada[i].assetID else {return}
                        guard let nome = moedaFiltrada[i].name else {return}
                        guard let valor = moedaFiltrada[i].priceUsd else {return}
                        guard let idIcon = moedaFiltrada[i].idIcon else {return}
                        let criptomoeda = Criptomoeda(sigla: sigla, nome: nome, valor: valor, imagem: idIcon)
                        self.listaDeMoedas.append(criptomoeda)
                     }
                    completion(self.listaDeMoedas)
                } catch let error {
                    guard let httpResponse = response as? HTTPURLResponse else {return}
                    self.tratamentoRequest.tratarErros(httpResponse)
                    print("error: \(error)")
                }
            }
        task.resume()
    }
    
    
    func makeRequestTelaPrincipalMockada(filename: String, completion:@escaping([Criptomoeda]) -> Void) {
        if let path = Bundle(for: type(of: self)).path(forResource: filename, ofType: "json") {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                do {
                    let moedas = try JSONDecoder().decode(Moedas.self, from: data)
                    var moedaFiltrada = moedas.filter {$0.typeIsCrypto == 1 && $0.priceUsd ?? 0>0 && (($0.idIcon?.isEmpty) != nil)}
                    for i in 0...(moedaFiltrada.count-1) {
                        guard let sigla = moedaFiltrada[i].assetID else {return}
                        guard let nome = moedaFiltrada[i].name else {return}
                        guard let valor = moedaFiltrada[i].priceUsd else {return}
                        guard let idIcon = moedaFiltrada[i].idIcon else {return}
                        let criptomoeda = Criptomoeda(sigla: sigla, nome: nome, valor: valor, imagem: idIcon)
                        self.listaDeMoedas.append(criptomoeda)
                    }
                    completion(self.listaDeMoedas)
                } catch let error {
                    print("error: \(error)")
                }
            }
        }
    }
}

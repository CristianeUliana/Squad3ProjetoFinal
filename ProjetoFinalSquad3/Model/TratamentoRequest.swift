//
//  TratamentoRequest.swift
//  ProjetoFinalSquad3
//
//  Created by Adalberto Sena Silva on 16/04/21.
//

import Foundation
import UIKit

struct MensagemDeErro {
    static let titulo400: String = "Erro 400: Bad Request"
    static let titulo401: String = "Erro 401: Unauthorized"
    static let titulo403: String = "Erro 403: Forbidden"
    static let titulo429: String = "Erro 429: Too Many Requests"
    static let titulo550: String = "Erro 550: No Data"
    static let mensagem400: String = "Falha na requisição dos dados, sintaxe invalida!"
    static let mensagem401: String = "Falha na requisição dos dados, autenticação inválida!"
    static let mensagem403: String = "Falha na requisição dos dados, sem permissão para acesso!"
    static let mensagem429: String = "Falha na requisição dos dados, quantidade de requisição excedida!"
    static let mensagem550: String = "Requisição sem dados!"
}


class TratamentoRequest {
    
    func tratarErros(_ erro: HTTPURLResponse) {
        let resposta = erro.statusCode
        switch resposta {
        case 400:
            self.alertaWindow(titulo: MensagemDeErro.titulo400, message: MensagemDeErro.mensagem400)
        case 401:
            self.alertaWindow(titulo: MensagemDeErro.titulo401, message: MensagemDeErro.mensagem401)
        case 403:
            self.alertaWindow(titulo: MensagemDeErro.titulo403, message: MensagemDeErro.mensagem403)
        case 429:
            self.alertaWindow(titulo: MensagemDeErro.titulo429, message: MensagemDeErro.mensagem429)
        case 550:
            self.alertaWindow(titulo: MensagemDeErro.titulo550, message: MensagemDeErro.mensagem550)
        default:
            break
          }
    }
    
    func alertaWindow(titulo: String, message: String) {
        let alerta = UIAlertController(title: titulo, message: message, preferredStyle: .alert)
        let botaoOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alerta.addAction(botaoOk)
        alerta.present(alerta, animated: true, completion: nil)
    }
}

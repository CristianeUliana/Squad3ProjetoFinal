//
//  DetalhesViewControllerTests.swift
//  ProjetoFinalSquad3Tests
//
//  Created by Cristiane Goncalves Uliana on 26/04/21.
//

import XCTest

@testable import ProjetoFinalSquad3

class DetalhesViewControllerTests: XCTestCase {

    
    var moedaSelecionada: Criptomoeda!
    var listaDePreferidas: [String] = ["USD","BTC","CAN"]
    
    
    override func setUp() {
        super.setUp()
        moedaSelecionada = Criptomoeda(sigla: "BTC", nome: "Bitcoin", valor: 250.50, imagem: "bitcoin")
    }

    override func tearDown() {
        super.tearDown()
    }

    
    func testDeveVerificarSeMoedaEstáNaListaDePreferidas() {
        
      
        

    }
    
    
    
    
    

}

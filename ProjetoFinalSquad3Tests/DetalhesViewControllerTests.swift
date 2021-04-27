//
//  DetalhesViewControllerTests.swift
//  ProjetoFinalSquad3Tests
//
//  Created by Cristiane Goncalves Uliana on 26/04/21.
//

import XCTest
@testable import ProjetoFinalSquad3

class DetalhesViewControllerTests: XCTestCase {

    let controller = DetalhesViewController()
    var moedaSelecionada: Criptomoeda!
    var listaDePreferidas: [String] = ["USD","BTC","CAN"]
    
    
    override func setUp() {
        super.setUp()
        moedaSelecionada = Criptomoeda(sigla: "BTC", nome: "Bitcoin", valor: 250.50, imagem: "bitcoin")
    }

    override func tearDown() {
        super.tearDown()
    }

    
    func testDeveRemoverMoedaDaListaDePreferidas() {
        
        controller.listaDePreferidas = listaDePreferidas
        let listaDePreferidasAtualizada = controller.removerDaLista(moedaSelecionada.sigla)
      
        XCTAssertEqual(2, listaDePreferidasAtualizada.count)
        XCTAssertEqual(listaDePreferidasAtualizada[0], "USD")
        XCTAssertEqual(listaDePreferidasAtualizada[1], "CAN")

    }

}

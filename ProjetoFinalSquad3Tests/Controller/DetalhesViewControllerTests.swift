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

    func testFormatadorDeNumero() {
        
        let numero1: Double = 0
        let numero2: Double = -10
        let numero3: Double = 9999999
        
        let resultado1 = numero1.formatador()
        let resultado2 = numero2.formatador()
        let resultado3 = numero3.formatador()
        
        XCTAssertEqual(resultado1, "$ 0,00")
        XCTAssertEqual(resultado2, "$ -10,00")
        XCTAssertEqual(resultado3, "$ 9.999.999,00")
    }
 

}

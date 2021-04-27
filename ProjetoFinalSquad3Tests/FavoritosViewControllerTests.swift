//
//  FavoritosViewControllerTests.swift
//  ProjetoFinalSquad3Tests
//
//  Created by Cristiane Goncalves Uliana on 26/04/21.
//

import XCTest
@testable import ProjetoFinalSquad3

class FavoritosViewControllerTests: XCTestCase {
    
    
    var listaDePreferidas: [String] = []
    
    var moedaCompartilhada: [Criptomoeda] = []
   
    let controller = FavoritosViewController()

    
    
    override func setUp() {
        var contadorCripto = 1
        for _ in 0...10 {
            let moeda = Criptomoeda(sigla: "TST\(contadorCripto)", nome: "teste\(contadorCripto)", valor: 20.5 * Double(contadorCripto), imagem: "imagem\(contadorCripto)")
            moedaCompartilhada.append(moeda)
            contadorCripto += 1
        }
    }

    
    override func tearDown()  {
        
    }

   
    
    func testDeveCriarListaDeCriptomoedasFavoritas() {
        var contadorString = 2
        for _ in 0...3 {
            let sigla = "TST\(contadorString)"
            listaDePreferidas.append(sigla)
            contadorString += 2
        }
        
        controller.recuperaDados(listaDePreferidas, moedaCompartilhada)
        
        XCTAssertEqual(4, controller.listaMoedasFavoritas.count)
    }
    
    
    func testDeveIgnorarStringVaziaDentroDoArrayDeFavoritas() {
        var sigla1 = "TST2"
        var sigla2 = ""
        var sigla3 = "TST4"
        var sigla4 = "TST6"
        
        listaDePreferidas.append(sigla1)
        listaDePreferidas.append(sigla2)
        listaDePreferidas.append(sigla3)
        listaDePreferidas.append(sigla4)
        
        controller.recuperaDados(listaDePreferidas, moedaCompartilhada)
        
        XCTAssertEqual(3, controller.listaMoedasFavoritas.count)
    }
    

    
    
}

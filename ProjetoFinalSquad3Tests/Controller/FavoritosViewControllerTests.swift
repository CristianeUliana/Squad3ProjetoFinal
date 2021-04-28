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
    var favoritosViewController: FavoritosViewController!
    
    
    override func setUp() {
        var contadorCripto = 1
        for _ in 0...10 {
            let moeda = Criptomoeda(sigla: "TST\(contadorCripto)", nome: "teste\(contadorCripto)", valor: 20.5 * Double(contadorCripto), imagem: "imagem\(contadorCripto)")
            moedaCompartilhada.append(moeda)
            contadorCripto += 1
        }
        
        favoritosViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "favoritosViewController") as? FavoritosViewController
        _ = favoritosViewController.view
    }

    
    override func tearDown()  {
        
    }

    
    
    func testCollectionViewNaoDeveEstarNilAposViewDidLoad() {
        let sut = favoritosViewController
        XCTAssertNotNil(sut?.myCollection)
    }
    
    
    func testDataSourceDaTableViewNaoDeveSerNil() {
        let sut = favoritosViewController
        
        XCTAssertNotNil(sut?.myCollection?.dataSource)
        XCTAssertNotNil(sut?.myCollection?.dataSource is FavoritosViewController)
    }
    
//    func testCellForItemDeveRetornarCustomCollectionViewCell() {
//        let collection = favoritosViewController?.myCollection
//        favoritosViewController.listaMoedasFavoritas = moedaCompartilhada
//        collection?.reloadData()
//        let indexPath = IndexPath(item: 0, section: 0)
//        let cell = collection?.cellForItem(at: indexPath)
//        
//        XCTAssertTrue(cell is CustomCollectionViewCell)
//    }
    
    
    func testNumeroDeItensDaCollectionDeveSerIgualAQuantidadeDeDadosDoArray() {
        
        favoritosViewController.listaMoedasFavoritas = moedaCompartilhada
        
        XCTAssertEqual(favoritosViewController.myCollection?.numberOfItems(inSection: 0), 11, "Numero de itens na collection deve ser igual a 11")
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
        let sigla1 = "TST2"
        let sigla2 = ""
        let sigla3 = "TST4"
        let sigla4 = "TST6"
        
        listaDePreferidas.append(sigla1)
        listaDePreferidas.append(sigla2)
        listaDePreferidas.append(sigla3)
        listaDePreferidas.append(sigla4)
        
        controller.recuperaDados(listaDePreferidas, moedaCompartilhada)
        
        XCTAssertEqual(3, controller.listaMoedasFavoritas.count)
    }
    

    
    
}

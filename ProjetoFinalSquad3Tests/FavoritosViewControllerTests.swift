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
        
        favoritosViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "favoritosViewController") as! FavoritosViewController
        _ = favoritosViewController.view
        
    }

    
    override func tearDown()  {
        
    }

    
    func testNumeroDeItensDaCollectionDeveSerIgualAQuantidadeDeDadosDoArray() {
        
        favoritosViewController.listaMoedasFavoritas = moedaCompartilhada
        
        XCTAssertEqual(favoritosViewController.myCollection?.numberOfItems(inSection: 0), 11, "Numero de itens na collection deve ser igual a 11")
    }
    
    
    
//    func testDadosEstaoSendoApresentadosCorretamente() {
//        favoritosViewController.listaMoedasFavoritas = moedaCompartilhada
//        favoritosViewController.myCollection?.reloadData()
//        let indiceCell1 = NSIndexPath(item: 0, section: 0)
//        let primeiraCell = favoritosViewController.myCollection?.cellForItem(at: indiceCell1 as IndexPath) as! CustomCollectionViewCell
//        let indiceCell2 = NSIndexPath(item: 1, section: 0)
//        let segundaCell = favoritosViewController.myCollection?.cellForItem(at: indiceCell2 as IndexPath) as! CustomCollectionViewCell
//        let indiceCell3 = NSIndexPath(item: 2, section: 0)
//        let terceiraCell = favoritosViewController.myCollection?.cellForItem(at: indiceCell3 as IndexPath) as! CustomCollectionViewCell
//        
//        XCTAssertEqual(primeiraCell.siglaMoeda?.text, "TST1")
//        XCTAssertEqual(segundaCell.siglaMoeda?.text, "TST2")
//        XCTAssertEqual(terceiraCell.siglaMoeda?.text, "TST3")
//       
//    }
//    
    
    
    
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

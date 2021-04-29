//
//  MoedasViewControllerTests.swift
//  ProjetoFinalSquad3Tests
//
//  Created by Cristiane Goncalves Uliana on 27/04/21.
//

import XCTest
@testable import ProjetoFinalSquad3

class MoedasViewControllerTests: XCTestCase {

    var moedaViewController: MoedasViewController!
    var listaDeCriptomoedas: [Criptomoeda] = []
    
    override func setUpWithError() throws {
        var contadorCripto = 1
        for _ in 0...10 {
            let moeda = Criptomoeda(sigla: "TST\(contadorCripto)", nome: "teste\(contadorCripto)", valor: 20.5 * Double(contadorCripto), imagem: "imagem\(contadorCripto)")
            listaDeCriptomoedas.append(moeda)
            contadorCripto += 1
        }
        
        moedaViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MoedasViewController") as? MoedasViewController
        _ = moedaViewController.view
    }

    override func tearDownWithError() throws {
      
    }

    
    
    func testTableViewNaoDeveEstarNilAposViewDidLoad() {
        let sut = moedaViewController
        XCTAssertNotNil(sut?.listaMoedasTable)
    }
    
    
    func testDataSourceDaTableViewNaoDeveSerNil() {
        let sut = moedaViewController
        XCTAssertNotNil(sut?.listaMoedasTable?.dataSource)
        XCTAssertNotNil(sut?.listaMoedasTable?.dataSource is MoedasViewController)
    }
    
    func testCellForRowDeveRetornarCustumTableViewCell() {
        let table = moedaViewController?.listaMoedasTable
        moedaViewController.listaDePesquisa = listaDeCriptomoedas
        table?.reloadData()
        let cell = table?.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(cell is CustumTableViewCell)
    }
    
    
    func testNumeroDeItensDaTabelaDeveSerIgualAQuantidadeDeDadosDoArray() {
        moedaViewController.listaDePesquisa = listaDeCriptomoedas
        XCTAssertEqual(moedaViewController.listaMoedasTable?.numberOfRows(inSection: 0), 11, "Numero de rows na tabela deve ser igual a 11")
    }
  
    
    func testDadosEstaoSendoApresentadosCorretamente() {
        moedaViewController.listaDePesquisa = listaDeCriptomoedas
        moedaViewController.listaMoedasTable?.reloadData()
        let indiceCell1 = NSIndexPath(row: 0, section: 0)
        let primeiraCell = moedaViewController.listaMoedasTable?.cellForRow(at: indiceCell1 as IndexPath) as! CustumTableViewCell
        let indiceCell2 = NSIndexPath(row: 1, section: 0)
        let segundaCell = moedaViewController.listaMoedasTable?.cellForRow(at: indiceCell2 as IndexPath) as! CustumTableViewCell
        let indiceCell3 = NSIndexPath(row: 2, section: 0)
        let terceiraCell = moedaViewController.listaMoedasTable?.cellForRow(at: indiceCell3 as IndexPath) as! CustumTableViewCell
        
        XCTAssertEqual(primeiraCell.siglaLabel?.text, "TST1")
        XCTAssertEqual(segundaCell.siglaLabel?.text, "TST2")
        XCTAssertEqual(terceiraCell.siglaLabel?.text, "TST3")
       
    }
    
    
    
    
}

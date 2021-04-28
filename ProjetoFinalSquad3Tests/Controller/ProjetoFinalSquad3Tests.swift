//
//  ProjetoFinalSquad3Tests.swift
//  ProjetoFinalSquad3Tests
//
//  Created by Adalberto Sena Silva on 13/04/21.
//

import XCTest
import Commons
@testable import ProjetoFinalSquad3

class ProjetoFinalSquad3Tests: XCTestCase {

    var moedaViewController: MoedasViewController!
    var favoritosViewController: FavoritosViewController!
    var detalhesViewController: DetalhesViewController!
    var customTableViewCell: CustumTableViewCell!
    var customCollectionViewCell: CustomCollectionViewCell!
    
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
  

    func testeMoedaViewController() throws {
        moedaViewController = MoedasViewController()
        moedaViewController.viewDidLoad()
    }
    
    func testeMoedaViewControllerWillAppear() throws {
        moedaViewController = MoedasViewController()
        moedaViewController.viewWillAppear(true)
    }
    
    func testeFavoritosViewController() throws {
        favoritosViewController = FavoritosViewController()
        favoritosViewController.viewDidLoad()
    }

    func testeFavoritosViewControllerWillAppear() throws {
        favoritosViewController = FavoritosViewController()
        favoritosViewController.viewWillAppear(true)
    }
    
    func testeDetalhesViewController() throws {
        detalhesViewController = DetalhesViewController()
        detalhesViewController.viewDidLoad()
    }
        
    func testeDetalhesViewControllerWillAppear() throws {
        detalhesViewController = DetalhesViewController()
        detalhesViewController.viewWillAppear(true)
    }

    func testCustomTableViewCell() throws {
        customTableViewCell = CustumTableViewCell()
        customTableViewCell.awakeFromNib()
    }
    
    func testCustomCollectionViewCell() throws {
        customCollectionViewCell = CustomCollectionViewCell()
        customCollectionViewCell.awakeFromNib()
    }
    
   
    func testCustomTableViewCellConfigurarCelula() {
        let moeda = Criptomoeda(sigla: "", nome: "", valor: 0.0, imagem: "")
        customTableViewCell = CustumTableViewCell()
        customTableViewCell.configuraCelula(moeda)
        
    }
    
    func testCustomCollectionViewCellConfigurarCelula() {
        let moeda = Criptomoeda(sigla: "", nome: "", valor: 0.0, imagem: "")
        customCollectionViewCell = CustomCollectionViewCell()
        customCollectionViewCell.configuraCelula(moeda)
        
    }
    
    
    
    
    
    
    
}

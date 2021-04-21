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
    

    func testeMoedaViewController() throws {
        moedaViewController = MoedasViewController()
        moedaViewController.viewDidLoad()
    }
    
    func testeFavoritosViewController() throws {
        favoritosViewController = FavoritosViewController()
        favoritosViewController.viewDidLoad()
    }
    
    func testeDetalhesViewController() throws {
        detalhesViewController = DetalhesViewController()
        detalhesViewController.viewDidLoad()
    }
        
   

    func testPerformanceExample() throws {
        self.measure {
    
        }
    }
}

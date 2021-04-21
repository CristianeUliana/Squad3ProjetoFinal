//
//  ProjetoFinalSquad3Tests.swift
//  ProjetoFinalSquad3Tests
//
//  Created by Adalberto Sena Silva on 13/04/21.
//

import XCTest
@testable import ProjetoFinalSquad3

class ProjetoFinalSquad3Tests: XCTestCase {

    var moedaViewController: MoedasViewController!
    
    override func setUpWithError() throws {
    
    }

    override func tearDownWithError() throws {
 
    }

    func testeMoedaViewController() throws {
            moedaViewController = MoedasViewController()
            moedaViewController.viewDidLoad()
        }
        

    func testPerformanceExample() throws {
        self.measure {
    
        }
    }

}

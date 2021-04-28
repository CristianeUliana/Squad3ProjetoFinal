//
//  RequestTests.swift
//  ProjetoFinalSquad3Tests
//
//  Created by Cristiane Goncalves Uliana on 28/04/21.
//

import XCTest
@testable import ProjetoFinalSquad3

class RequestTests: XCTestCase {
    
    let request = Request()
    var listaCriptomoeda: [Criptomoeda] = []
    

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
       
    }

    func testDeveRetornarArrayDeCriptomoedas() {
        
        request.makeRequestTelaPrincipal { (resultado) in
            self.listaCriptomoeda = resultado
        }
    
        XCTAssertNotNil(listaCriptomoeda )
    }

}

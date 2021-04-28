//
//  TratamentoRequestTest.swift
//  ProjetoFinalSquad3Tests
//
//  Created by Cristiane Goncalves Uliana on 26/04/21.
//

import XCTest
import Cuckoo
@testable import ProjetoFinalSquad3

class TratamentoRequestTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testDeveMostrarAvisoQuandoRespostaDaApiApresentarErro() {

        guard let url = URL(string: "mock") else {return}
        let httpVersion = ""
        let headerFields = ["":""]

        guard let respostaHTTP = HTTPURLResponse(url: url, statusCode: 400, httpVersion: httpVersion, headerFields: headerFields) else {return}

        let respostaFake = MockTratamentoRequest().withEnabledSuperclassSpy()

        respostaFake.tratarErros(respostaHTTP)
        stub(respostaFake) { (respostaFake) in
            when(respostaFake.alertaWindow(titulo: MensagemDeErro.titulo400, message: MensagemDeErro.mensagem400)).thenDoNothing()
        }

        verify(respostaFake).alertaWindow(titulo: MensagemDeErro.titulo400, message: MensagemDeErro.mensagem400)
    }
    

}

// MARK: - Mocks generated from file: ProjetoFinalSquad3/Model/TratamentoRequest.swift at 2021-04-30 20:18:08 +0000

//
//  TratamentoRequest.swift
//  ProjetoFinalSquad3
//
//  Created by Adalberto Sena Silva on 16/04/21.
//

import Cuckoo
@testable import ProjetoFinalSquad3

import Foundation
import UIKit


 class MockTratamentoRequest: TratamentoRequest, Cuckoo.ClassMock {
    
     typealias MocksType = TratamentoRequest
    
     typealias Stubbing = __StubbingProxy_TratamentoRequest
     typealias Verification = __VerificationProxy_TratamentoRequest

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: TratamentoRequest?

     func enableDefaultImplementation(_ stub: TratamentoRequest) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func tratarErros(_ erro: HTTPURLResponse)  {
        
    return cuckoo_manager.call("tratarErros(_: HTTPURLResponse)",
            parameters: (erro),
            escapingParameters: (erro),
            superclassCall:
                
                super.tratarErros(erro)
                ,
            defaultCall: __defaultImplStub!.tratarErros(erro))
        
    }
    
    
    
     override func alertaWindow(titulo: String, message: String)  {
        
    return cuckoo_manager.call("alertaWindow(titulo: String, message: String)",
            parameters: (titulo, message),
            escapingParameters: (titulo, message),
            superclassCall:
                
                super.alertaWindow(titulo: titulo, message: message)
                ,
            defaultCall: __defaultImplStub!.alertaWindow(titulo: titulo, message: message))
        
    }
    

	 struct __StubbingProxy_TratamentoRequest: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func tratarErros<M1: Cuckoo.Matchable>(_ erro: M1) -> Cuckoo.ClassStubNoReturnFunction<(HTTPURLResponse)> where M1.MatchedType == HTTPURLResponse {
	        let matchers: [Cuckoo.ParameterMatcher<(HTTPURLResponse)>] = [wrap(matchable: erro) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTratamentoRequest.self, method: "tratarErros(_: HTTPURLResponse)", parameterMatchers: matchers))
	    }
	    
	    func alertaWindow<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(titulo: M1, message: M2) -> Cuckoo.ClassStubNoReturnFunction<(String, String)> where M1.MatchedType == String, M2.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: titulo) { $0.0 }, wrap(matchable: message) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTratamentoRequest.self, method: "alertaWindow(titulo: String, message: String)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_TratamentoRequest: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func tratarErros<M1: Cuckoo.Matchable>(_ erro: M1) -> Cuckoo.__DoNotUse<(HTTPURLResponse), Void> where M1.MatchedType == HTTPURLResponse {
	        let matchers: [Cuckoo.ParameterMatcher<(HTTPURLResponse)>] = [wrap(matchable: erro) { $0 }]
	        return cuckoo_manager.verify("tratarErros(_: HTTPURLResponse)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func alertaWindow<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(titulo: M1, message: M2) -> Cuckoo.__DoNotUse<(String, String), Void> where M1.MatchedType == String, M2.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: titulo) { $0.0 }, wrap(matchable: message) { $0.1 }]
	        return cuckoo_manager.verify("alertaWindow(titulo: String, message: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class TratamentoRequestStub: TratamentoRequest {
    

    

    
     override func tratarErros(_ erro: HTTPURLResponse)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func alertaWindow(titulo: String, message: String)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


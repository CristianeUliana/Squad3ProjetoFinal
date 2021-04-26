// MARK: - Mocks generated from file: ProjetoFinalSquad3/Provider/MoedaDao.swift at 2021-04-26 17:25:38 +0000

//
//  MoedaDao.swift
//  ProjetoFinalSquad3
//
//  Created by Cristiane Goncalves Uliana on 20/04/21.
//

import Cuckoo
@testable import ProjetoFinalSquad3

import CoreData
import Foundation
import UIKit


 class MockMoedaDao: MoedaDao, Cuckoo.ClassMock {
    
     typealias MocksType = MoedaDao
    
     typealias Stubbing = __StubbingProxy_MoedaDao
     typealias Verification = __VerificationProxy_MoedaDao

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: MoedaDao?

     func enableDefaultImplementation(_ stub: MoedaDao) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var moedaFavorita: Favoritos? {
        get {
            return cuckoo_manager.getter("moedaFavorita",
                superclassCall:
                    
                    super.moedaFavorita
                    ,
                defaultCall: __defaultImplStub!.moedaFavorita)
        }
        
        set {
            cuckoo_manager.setter("moedaFavorita",
                value: newValue,
                superclassCall:
                    
                    super.moedaFavorita = newValue
                    ,
                defaultCall: __defaultImplStub!.moedaFavorita = newValue)
        }
        
    }
    
    
    
     override var gerenciadorDeResultados: NSFetchedResultsController<Favoritos>? {
        get {
            return cuckoo_manager.getter("gerenciadorDeResultados",
                superclassCall:
                    
                    super.gerenciadorDeResultados
                    ,
                defaultCall: __defaultImplStub!.gerenciadorDeResultados)
        }
        
        set {
            cuckoo_manager.setter("gerenciadorDeResultados",
                value: newValue,
                superclassCall:
                    
                    super.gerenciadorDeResultados = newValue
                    ,
                defaultCall: __defaultImplStub!.gerenciadorDeResultados = newValue)
        }
        
    }
    
    
    
     override var contexto: NSManagedObjectContext {
        get {
            return cuckoo_manager.getter("contexto",
                superclassCall:
                    
                    super.contexto
                    ,
                defaultCall: __defaultImplStub!.contexto)
        }
        
    }
    

    

    
    
    
     override func recuperaFavoritos() -> [Favoritos] {
        
    return cuckoo_manager.call("recuperaFavoritos() -> [Favoritos]",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.recuperaFavoritos()
                ,
            defaultCall: __defaultImplStub!.recuperaFavoritos())
        
    }
    
    
    
     override func adicionarMoeda(_ sigla: String)  {
        
    return cuckoo_manager.call("adicionarMoeda(_: String)",
            parameters: (sigla),
            escapingParameters: (sigla),
            superclassCall:
                
                super.adicionarMoeda(sigla)
                ,
            defaultCall: __defaultImplStub!.adicionarMoeda(sigla))
        
    }
    
    
    
     override func deletarMoeda(_ moeda: Favoritos)  {
        
    return cuckoo_manager.call("deletarMoeda(_: Favoritos)",
            parameters: (moeda),
            escapingParameters: (moeda),
            superclassCall:
                
                super.deletarMoeda(moeda)
                ,
            defaultCall: __defaultImplStub!.deletarMoeda(moeda))
        
    }
    

	 struct __StubbingProxy_MoedaDao: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var moedaFavorita: Cuckoo.ClassToBeStubbedOptionalProperty<MockMoedaDao, Favoritos> {
	        return .init(manager: cuckoo_manager, name: "moedaFavorita")
	    }
	    
	    
	    var gerenciadorDeResultados: Cuckoo.ClassToBeStubbedOptionalProperty<MockMoedaDao, NSFetchedResultsController<Favoritos>> {
	        return .init(manager: cuckoo_manager, name: "gerenciadorDeResultados")
	    }
	    
	    
	    var contexto: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockMoedaDao, NSManagedObjectContext> {
	        return .init(manager: cuckoo_manager, name: "contexto")
	    }
	    
	    
	    func recuperaFavoritos() -> Cuckoo.ClassStubFunction<(), [Favoritos]> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockMoedaDao.self, method: "recuperaFavoritos() -> [Favoritos]", parameterMatchers: matchers))
	    }
	    
	    func adicionarMoeda<M1: Cuckoo.Matchable>(_ sigla: M1) -> Cuckoo.ClassStubNoReturnFunction<(String)> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: sigla) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMoedaDao.self, method: "adicionarMoeda(_: String)", parameterMatchers: matchers))
	    }
	    
	    func deletarMoeda<M1: Cuckoo.Matchable>(_ moeda: M1) -> Cuckoo.ClassStubNoReturnFunction<(Favoritos)> where M1.MatchedType == Favoritos {
	        let matchers: [Cuckoo.ParameterMatcher<(Favoritos)>] = [wrap(matchable: moeda) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMoedaDao.self, method: "deletarMoeda(_: Favoritos)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_MoedaDao: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var moedaFavorita: Cuckoo.VerifyOptionalProperty<Favoritos> {
	        return .init(manager: cuckoo_manager, name: "moedaFavorita", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var gerenciadorDeResultados: Cuckoo.VerifyOptionalProperty<NSFetchedResultsController<Favoritos>> {
	        return .init(manager: cuckoo_manager, name: "gerenciadorDeResultados", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var contexto: Cuckoo.VerifyReadOnlyProperty<NSManagedObjectContext> {
	        return .init(manager: cuckoo_manager, name: "contexto", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func recuperaFavoritos() -> Cuckoo.__DoNotUse<(), [Favoritos]> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("recuperaFavoritos() -> [Favoritos]", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func adicionarMoeda<M1: Cuckoo.Matchable>(_ sigla: M1) -> Cuckoo.__DoNotUse<(String), Void> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: sigla) { $0 }]
	        return cuckoo_manager.verify("adicionarMoeda(_: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func deletarMoeda<M1: Cuckoo.Matchable>(_ moeda: M1) -> Cuckoo.__DoNotUse<(Favoritos), Void> where M1.MatchedType == Favoritos {
	        let matchers: [Cuckoo.ParameterMatcher<(Favoritos)>] = [wrap(matchable: moeda) { $0 }]
	        return cuckoo_manager.verify("deletarMoeda(_: Favoritos)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class MoedaDaoStub: MoedaDao {
    
    
     override var moedaFavorita: Favoritos? {
        get {
            return DefaultValueRegistry.defaultValue(for: (Favoritos?).self)
        }
        
        set { }
        
    }
    
    
     override var gerenciadorDeResultados: NSFetchedResultsController<Favoritos>? {
        get {
            return DefaultValueRegistry.defaultValue(for: (NSFetchedResultsController<Favoritos>?).self)
        }
        
        set { }
        
    }
    
    
     override var contexto: NSManagedObjectContext {
        get {
            return DefaultValueRegistry.defaultValue(for: (NSManagedObjectContext).self)
        }
        
    }
    

    

    
     override func recuperaFavoritos() -> [Favoritos]  {
        return DefaultValueRegistry.defaultValue(for: ([Favoritos]).self)
    }
    
     override func adicionarMoeda(_ sigla: String)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func deletarMoeda(_ moeda: Favoritos)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


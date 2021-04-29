//
//  SnapshotDetalhesViewController.swift
//  ProjetoFinalSquad3Tests
//
//  Created by Cristiane Goncalves Uliana on 26/04/21.
//

import Quick
import Nimble
import Nimble_Snapshots
import DetalhesMoedas
@testable import ProjetoFinalSquad3

class DetalhesViewXibTests: QuickSpec {
    
    override func spec() {
        describe("DetalhesMoeda"){
            var view: DetalhesMoeda!
            
            beforeEach {
                view = DetalhesMoeda.fromNib()

            }
            
            it("should have a cool layout") {
                expect(view) == recordSnapshot()
                //expect(view) == snapshot()
            }
        }
    }
}


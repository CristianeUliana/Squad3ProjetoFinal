//
//  SnapshotTest.swift
//  ProjetoFinalSquad3Tests
//
//  Created by Cristiane Goncalves Uliana on 26/04/21.
//

import Quick
import Nimble
import Nimble_Snapshots
@testable import ProjetoFinalSquad3

class CollectionCellViewXibTests: QuickSpec {
    
    override func spec() {
        describe("CustomCollectionViewCell"){
            var view: CustomCollectionViewCell!
            
            beforeEach {
                view = Bundle.main.loadNibNamed("CustomCollectionViewCell",
                                                owner: nil,
                                                options: nil)?.first as! CustomCollectionViewCell
            }
            
            it("should have a cool layout") {
                expect(view) == recordSnapshot()
                //expect(view) == snapshot()
                
            }
        }
    }
}



//
//  SnapshotTestTableCell.swift
//  ProjetoFinalSquad3Tests
//
//  Created by Cristiane Goncalves Uliana on 26/04/21.
//

import Quick
import Nimble
import Nimble_Snapshots
@testable import ProjetoFinalSquad3

class TableCellViewXibTests: QuickSpec {
    
    override func spec() {
        describe("CustumTableViewCell"){
            var view: CustumTableViewCell!
            
            beforeEach {
                view = Bundle.main.loadNibNamed("CustumTableViewCell",
                                                owner: nil,
                                                options: nil)?.first as! CustumTableViewCell
            }
            
            it("should have a cool layout") {
                expect(view) == snapshot()
                
            }
        }
    }
}

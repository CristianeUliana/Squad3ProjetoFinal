//
//  SnapshotTelaMoedas.swift
//  ProjetoFinalSquad3Tests
//
//  Created by Cristiane Goncalves Uliana on 28/04/21.
//

import Quick
import Nimble
import Nimble_Snapshots
@testable import ProjetoFinalSquad3Tests

class MoedasViewControllerSnapshot: QuickSpec  {

    override func spec() {
        describe("MoedasViewController") {
            var view: UIViewController!
            beforeEach {
                view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MoedasViewController") as UIViewController
                _ = view.view
               
            }
            it("should have a cool layout") {
                //expect(view) == recordSnapshot()
                expect(view) == snapshot()
            }
        }
    }

}

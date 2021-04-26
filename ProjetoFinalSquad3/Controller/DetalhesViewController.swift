//
//  DetalhesViewController.swift
//  ProjetoFinalSquad3
//
//  Created by Adalberto Sena Silva on 15/04/21.
//

import UIKit
import DetalhesMoedas
import CoreData



public protocol ReloadDataDelegate: class {
    func reloadDataAction()
}

class DetalhesViewController: UIViewController, DetalhesMoedaDelegate, NSFetchedResultsControllerDelegate {
    
    
    // MARK: - IBOutlets
    
    @IBOutlet var telaDetalhes: UIStackView!
    
    
    // MARK: - Variáveis
    
    weak var delegate: ReloadDataDelegate?
    
    let detalhes = DetalhesMoeda.fromNib()
    
    var moedaSelecionada: Criptomoeda?
    
//    var sigla: String?
//
//    var ehFavorita: Bool = false
//
//    var moedaFavorita: Favoritos?
//
//    var indiceFavorita: Int?
    
    var listaDePreferidas: [String] = []
    
    let defaults = UserDefaults.standard
    
    
    // MARK: - Ciclo de Vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        telaDetalhes.addSubview(detalhes)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        listaDePreferidas = defaults.object(forKey: "listaSiglas") as? [String] ?? []
        
        configurarTelaFavorita()
        
        detalhes.setupUI(moedaDelegate: self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        delegate?.reloadDataAction()
    }
    
    // MARK: - Métodos
    
    
    
//    func verificarMoeda() {
//        guard let sigla = moedaSelecionada?.sigla else { return "" }
//
//    }
    
    
    
    func configurarTelaFavorita() {

        guard let sigla = moedaSelecionada?.sigla else {return}
        detalhes.makeRequestDetalhes(sigla, "estrelaDetalhes")
        
        if listaDePreferidas.contains(sigla) {
            detalhes.verificarFavoritos(true)
        } else {
            detalhes.verificarFavoritos(false)
        }
    }
    
    
 
    // MARK: - DelegateBotão
    
    

    func buttonAction() {
        guard let sigla = moedaSelecionada?.sigla else {return}
        
        if listaDePreferidas.contains(sigla) {
            
            let listaAtualizada = removerDaLista(sigla)
            defaults.set(listaAtualizada, forKey: "listaSiglas")
            
            detalhes.verificarFavoritos(false)
            
        } else {
            
            listaDePreferidas.append(sigla)
            defaults.set(listaDePreferidas, forKey: "listaSiglas")
            
            detalhes.verificarFavoritos(true)
        }
    }
    
    
    
    func removerDaLista(_ sigla: String) -> [String] {
        for i in 0...listaDePreferidas.count-1 {
            if listaDePreferidas[i] == sigla {
                listaDePreferidas.remove(at: i)
                break
            }
        }
        return listaDePreferidas
    }
}

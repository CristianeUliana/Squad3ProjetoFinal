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
    
    let moedaDAO = MoedaDao()
    
    var moedaSelecionada: Criptomoeda?
    
    var sigla: String?
    
    var ehFavorita: Bool = false
    
    var moedaFavorita: Favoritos?
    
    var indiceFavorita: Int?
    
    var listaDePreferidas: [Favoritos] = []
    
    
    // MARK: - Ciclo de Vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        telaDetalhes.addSubview(detalhes)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listaDePreferidas = moedaDAO.recuperaFavoritos()
        sigla = verificarMoeda()
        detalhes.verificarFavoritos(ehFavorita)
        detalhes.setupUI(moedaDelegate: self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        delegate?.reloadDataAction()
    }
    
    // MARK: - Métodos
    

    func verificarMoeda() -> String {
        guard let sigla = moedaSelecionada?.sigla else { return "" }
        verificarFavorita(sigla)
        detalhes.makeRequestDetalhes(sigla, "estrelaDetalhes")
        return sigla
    }
    
    
    func verificarFavorita(_ sigla: String) {
        if (listaDePreferidas.count) > 0 {
            for i in 0...(listaDePreferidas.count - 1) {
                if listaDePreferidas[i].lista == sigla {
                    self.ehFavorita = true
                    self.indiceFavorita = i
                    break
                } else {
                    ehFavorita = false
                }
            }
        } else {
            ehFavorita = false
        }
    }
 
    // MARK: - DelegateBotão
    
    

    func buttonAction() {
        guard let sigla = moedaSelecionada?.sigla else {return}
        if ehFavorita == false {
            moedaDAO.adicionarMoeda(sigla)
            detalhes.verificarFavoritos(true)
        } else {
            removerMoedaFavorita(sigla)
            detalhes.verificarFavoritos(false)
        }
    }

    func removerMoedaFavorita(_ sigla: String) {
        let moedaRemovidaList = listaDePreferidas.filter {$0.lista == sigla}
        guard let moedaRemovida = moedaRemovidaList.first else {return}
        moedaDAO.deletarMoeda(moedaRemovida)
    }
}

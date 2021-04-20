//
//  DetalhesViewController.swift
//  ProjetoFinalSquad3
//
//  Created by Adalberto Sena Silva on 15/04/21.
//

import UIKit
import DetalhesMoedas
import CoreData

protocol ReloadDataDelegate: class {
    func reloadDataAction()
}

class DetalhesViewController: UIViewController, DetalhesMoedaDelegate, NSFetchedResultsControllerDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet var telaDetalhes: UIStackView!
    
    
    // MARK: - Variáveis
    
    var delegate: ReloadDataDelegate? = nil
    
    let detalhes = DetalhesMoeda.fromNib()
    
    let moedaDAO = MoedaDao()
    
    var moedaSelecionada: Criptomoeda?
    
    var sigla: String?
    
    var ehFavorita: Bool = false
    
    var moedaFavorita: Favoritos?
    
    var indiceFavorita: Int?
    
    var listaDePreferidas: [Favoritos] = []
    
    var gerenciadorDeResultados: NSFetchedResultsController<Favoritos>?
    
    var contexto: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    // MARK: - Ciclo de Vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        telaDetalhes.addSubview(detalhes)
        listaDePreferidas = moedaDAO.recuperaFavoritos()
        sigla = verificarMoeda()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let sigla = sigla else {return}
        detalhes.makeRequestDetalhes(sigla, "estrelaDetalhes")
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
        return sigla
    }
    
    
    func verificarFavorita(_ sigla: String) {
        if (listaDePreferidas.count) > 0 {
            for i in 0...(listaDePreferidas.count - 1) {
                if listaDePreferidas[i].lista == sigla {
                    ehFavorita = true
                    indiceFavorita = i
                    break
                }
            }
        }
    }
 
    // MARK: - DelegateBotão
    
    public func buttonAction() {
        if ehFavorita == false {
            if moedaFavorita == nil {
                moedaFavorita = Favoritos(context: contexto)
            }
            moedaFavorita?.lista = sigla
            ehFavorita = true
            detalhes.verificarFavoritos(ehFavorita)
            do {
                try contexto.save()
                } catch {
                    print(error.localizedDescription)
                }
        } else {
            guard let sigla = sigla else {return}
            verificarFavorita(sigla)
            guard let indice = indiceFavorita else {return}
            let moedaSelecionada = listaDePreferidas[indice]
            contexto.delete(moedaSelecionada)
            ehFavorita = false
            detalhes.verificarFavoritos(ehFavorita)
            do {
                try contexto.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

//
//  DetalhesViewController.swift
//  ProjetoFinalSquad3
//
//  Created by Adalberto Sena Silva on 15/04/21.
//

import UIKit
import DetalhesMoedas
import CoreData

class DetalhesViewController: UIViewController, DetalhesMoedaDelegate, NSFetchedResultsControllerDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet var telaDetalhes: UIStackView!
    
    
    // MARK: - Atributos
    
    let detalhes = DetalhesMoeda.fromNib()
    
    var moedaSelecionada: Criptomoeda?
    
    var contexto: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    var gerenciadorDeResultados:NSFetchedResultsController<Favoritos>?
    
    var sigla: String?
    
    var ehFavorita: Bool = false
    
    var moedaFavorita: Favoritos?
    
    var indiceFavorita: Int?
    
    
    // MARK: - Ciclo de Vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        telaDetalhes.addSubview(detalhes)
        recuperaFavoritos()
        sigla = verificarMoeda()
        //botoesMenu()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let sigla = sigla else {return}
        detalhes.makeRequestDetalhes(sigla, "estrelaDetalhes")
        detalhes.verificarFavoritos(ehFavorita)
        detalhes.setupUI(moedaDelegate: self)
    }
    
    
    // MARK: - Métodos
    
    func recuperaFavoritos() {
        let recuperaFavoritos: NSFetchRequest<Favoritos> = Favoritos.fetchRequest()
        let ordenaPorNome = NSSortDescriptor(key: "lista", ascending: true)
        recuperaFavoritos.sortDescriptors = [ordenaPorNome]
        gerenciadorDeResultados = NSFetchedResultsController(fetchRequest: recuperaFavoritos, managedObjectContext: contexto, sectionNameKeyPath: nil, cacheName: nil)
        gerenciadorDeResultados?.delegate = self
        do {
            try gerenciadorDeResultados?.performFetch()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    func verificarMoeda() -> String {
        guard let sigla = moedaSelecionada?.sigla else { return "" }
        verificarFavorita(sigla)
        return sigla
    }
    
    
    func verificarFavorita(_ sigla: String) {
        guard let gerenciador = gerenciadorDeResultados?.fetchedObjects else {return}
        if (gerenciador.count) > 0 {
            for i in 0...(gerenciador.count - 1) {
                if gerenciador[i].lista == sigla {
                    ehFavorita = true
                    indiceFavorita = i
                    break
                }
            }
        }
    }
 
    
    public func buttonAction() {
        print("botão")
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
            guard let moedaSelecionada = gerenciadorDeResultados?.fetchedObjects![indice] else {return}
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

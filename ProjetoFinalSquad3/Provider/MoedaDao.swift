//
//  MoedaDao.swift
//  ProjetoFinalSquad3
//
//  Created by Cristiane Goncalves Uliana on 20/04/21.
//

import Foundation
import UIKit
import CoreData

class MoedaDao: NSObject {
    
    // MARK: - Variáveis
    
//    var moedaFavorita: Favoritos?
//    
//    var gerenciadorDeResultados: NSFetchedResultsController<Favoritos>?
//    
//    var contexto: NSManagedObjectContext {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        return appDelegate.persistentContainer.viewContext
//    }
//    
//    // MARK: - RecuperaFavoritos
//    
//    func recuperaFavoritos() -> [Favoritos] {
//        let recuperaFavoritos: NSFetchRequest<Favoritos> = Favoritos.fetchRequest()
//        let ordenaPorNome = NSSortDescriptor(key: "lista", ascending: true)
//        recuperaFavoritos.sortDescriptors = [ordenaPorNome]
//        gerenciadorDeResultados = NSFetchedResultsController(fetchRequest: recuperaFavoritos, managedObjectContext: contexto, sectionNameKeyPath: nil, cacheName: nil)
//        do {
//            try gerenciadorDeResultados?.performFetch()
//        } catch {
//            print(error.localizedDescription)
//        }
//        guard let listaDeMoedas =  gerenciadorDeResultados?.fetchedObjects else {return [] }
//        return listaDeMoedas
//    }
//    
//    func adicionarMoeda(_ sigla: String) {
//        if moedaFavorita == nil {
//            moedaFavorita = Favoritos(context: contexto)
//        }
//        moedaFavorita?.lista = sigla
//        do {
//            try contexto.save()
//        } catch {
//            print(error)
//        }
//    }
//    
//    func deletarMoeda(_ moeda: Favoritos) {
//        contexto.delete(moeda)
//        do {
//            try contexto.save()
//        } catch {
//            print(error)
//        }
//    }
}

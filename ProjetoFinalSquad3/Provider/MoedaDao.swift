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
    
    var gerenciadorDeResultados: NSFetchedResultsController<Favoritos>?
    
    var contexto: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    // MARK: - RecuperaFavoritos
    
    func recuperaFavoritos() -> [Favoritos] {
        let recuperaFavoritos: NSFetchRequest<Favoritos> = Favoritos.fetchRequest()
        let ordenaPorNome = NSSortDescriptor(key: "lista", ascending: true)
        recuperaFavoritos.sortDescriptors = [ordenaPorNome]
        gerenciadorDeResultados = NSFetchedResultsController(fetchRequest: recuperaFavoritos, managedObjectContext: contexto, sectionNameKeyPath: nil, cacheName: nil)
        do {
            try gerenciadorDeResultados?.performFetch()
        } catch {
            print(error.localizedDescription)
        }
        guard let listaDeMoedas =  gerenciadorDeResultados?.fetchedObjects else {return [] }
        return listaDeMoedas
    }
}

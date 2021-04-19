//
//  FavoritosViewController.swift
//  ProjetoFinalSquad3
//
//  Created by Cristiane Goncalves Uliana on 16/04/21.
//

import UIKit
import Commons
import CoreData

class FavoritosViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, NSFetchedResultsControllerDelegate {
 
    
    
    // MARK: - Outlets

    @IBOutlet weak var myCollection: UICollectionView!
    @IBOutlet weak var dataLabel: UILabel!
    
    
    // MARK: - Variáveis
    
    var listaSiglasFavoritas: [String] = []
   
    var listaMoedasFavoritas: [Criptomoeda] = []
    
    var contexto: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    var gerenciadorDeResultados:NSFetchedResultsController<Favoritos>?
    
    
    // MARK: - Ciclo de Vida

    override func viewDidLoad() {
        super.viewDidLoad()
        self.myCollection.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")
        self.myCollection.delegate = self
        self.myCollection.dataSource = self
       // recuperaFavoritos()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        listaSiglasFavoritas = []
        listaMoedasFavoritas = []
        verificarFavoritas { (resultado) in
            self.recuperaDados(resultado)
        }
    }

    
    
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
    
    
    func verificarFavoritas(completion: @escaping([String]) -> Void) {
        recuperaFavoritos()
        guard  let numeroMoedasFavoritas = gerenciadorDeResultados?.fetchedObjects?.count else { return }
        if numeroMoedasFavoritas > 0 {
            for i in 0...(((gerenciadorDeResultados?.fetchedObjects!.count)!) - 1) {
                guard let sigla = gerenciadorDeResultados?.fetchedObjects?[i].lista else {return}
                listaSiglasFavoritas.append(sigla)
            }
        }
        completion(listaSiglasFavoritas)
    }


    func recuperaDados(_ listaSiglasFavoritas: [String]) {
        for sigla in listaSiglasFavoritas {
            makeRequestBySigla(sigla) { (resultado) in
                self.setupUI(resultado)
            }
        }
    }


    func makeRequestBySigla(_ sigla: String, completion: @escaping(Criptomoeda) -> Void) {
        let newUrl = ApiRest.MoedaDetalhe.replacingOccurrences(of: "@@@", with: sigla)
        let url = URL(string: newUrl)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            print(response as Any)
            guard let responseData = data else { return }
            do {
                let moedas = try JSONDecoder().decode(Moedas.self, from: responseData)
                for moeda in moedas {
                    guard let nome = moeda.name else {return}
                    guard let valor = moeda.priceUsd else {return}
                    guard let imagem = moeda.idIcon else {return}
                    let criptoMoeda = Criptomoeda(sigla: sigla, nome: nome, valor: valor, imagem: imagem)
                    
                    completion(criptoMoeda)
                   // self.listaMoedasFavoritas.append(criptoMoeda)
                }
            } catch let error {
                print("error: \(error)")
            }
        }
        task.resume()
    }

    
    func setupUI(_ moeda: Criptomoeda){
        self.listaMoedasFavoritas.append(moeda)
            DispatchQueue.main.async {
                self.myCollection.reloadData()
            }
    }
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaMoedasFavoritas.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFavorita = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        let moedaAtual = listaMoedasFavoritas[indexPath.item]
        celulaFavorita.configuraCelula(moedaAtual)
        return celulaFavorita
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: collectionView.bounds.width/2-10, height: 210) : CGSize(width: collectionView.bounds.width/3-20, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let moedaSelecionada = listaMoedasFavoritas[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhesMoedaSelecionada") as! DetalhesViewController
        controller.moedaSelecionada = moedaSelecionada
        show(controller, sender: self)
    }
}

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
    
    let request = Request()
    
    let moedaDAO = MoedaDao()
    
    var listaSiglasFavoritas: [String] = []
   
    var listaMoedasFavoritas: [Criptomoeda] = []
    
    var listaDePreferidas: [Favoritos] = []

    
    // MARK: - Ciclo de Vida

    override func viewDidLoad() {
        super.viewDidLoad()
        self.myCollection.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")
        self.myCollection.delegate = self
        self.myCollection.dataSource = self
        dataLabel.text = mostrarDataAtual()
        accessibilityFavoritos()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        recarregarDados()
    }
    
    
    // MARK: - Acessibilidades
    
    func accessibilityFavoritos() {
        dataLabel.isAccessibilityElement = true
        dataLabel.accessibilityTraits = .header
        dataLabel.accessibilityLabel = "Data de Hoje"
    }
    

    // MARK: - Funções
    
    
    func recarregarDados() {
        guard let moedaCompartilhada = MoedaGlobal.moedaInstanciada.moedaCompartilhada else {return}
        verificarFavoritas()
        recuperaDados(listaSiglasFavoritas, moedaCompartilhada)
        DispatchQueue.main.async {
            self.myCollection.reloadData()
        }
    }
    
    func verificarFavoritas() {
        listaDePreferidas = []
        listaSiglasFavoritas = []
        listaDePreferidas = moedaDAO.recuperaFavoritos()
        let numeroMoedasFavoritas = listaDePreferidas.count
        if numeroMoedasFavoritas > 0 {
            for i in 0...(listaDePreferidas.count - 1) {
                guard let sigla = listaDePreferidas[i].lista else {return}
                listaSiglasFavoritas.append(sigla)
            }
        }
    }
    
    func recuperaDados(_ listaSiglasFavoritas: [String], _ moedaCompartilhada: [Criptomoeda]) {
        listaMoedasFavoritas = []
        for i in 0...moedaCompartilhada.count-1 {
            let sigla = moedaCompartilhada[i].sigla
            if listaSiglasFavoritas.contains(sigla) {
                listaMoedasFavoritas.append(moedaCompartilhada[i])
            }
        }
    }
    
    

    // MARK: - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaMoedasFavoritas.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFavorita = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        celulaFavorita.tag = indexPath.row
        let moedaAtual = listaMoedasFavoritas[indexPath.item]
        celulaFavorita.configuraCelula(moedaAtual)
        return celulaFavorita
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let moedaSelecionada = listaMoedasFavoritas[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhesMoedaSelecionada") as! DetalhesViewController
        controller.delegate = self
        controller.moedaSelecionada = moedaSelecionada
        show(controller, sender: self)
    }
}


    // MARK: - Extension

extension FavoritosViewController: ReloadDataDelegate {

    func reloadDataAction() {
        recarregarDados()
    }
}

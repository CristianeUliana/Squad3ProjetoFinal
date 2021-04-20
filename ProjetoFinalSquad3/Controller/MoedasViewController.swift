//
//  MoedasViewController.swift
//  ProjetoFinalSquad3
//
//  Created by Adalberto Sena Silva on 15/04/21.
//

import UIKit
import Commons
import AlamofireImage
import DetalhesMoedas
import CoreData


class MoedasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate, UISearchBarDelegate {
    
     // MARK: - Outlets
   
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var listaMoedasTable: UITableView!
    @IBOutlet weak var pesquisarMoeda: UISearchBar!
    
    
    
    // MARK: - Acessibilidades
    
    func accessibilityFavoritos() {
        
        dataLabel.isAccessibilityElement = true
        dataLabel.accessibilityTraits = .header
        dataLabel.accessibilityLabel = "Data de Hoje"
        
        pesquisarMoeda.isAccessibilityElement = true
        pesquisarMoeda.accessibilityTraits = .searchField
        pesquisarMoeda.accessibilityLabel = "Pesquisa Moeda"
        
    }
    // MARK: - Variáveis
    
    let request = Request()
    
    let moedaDAO = MoedaDao()
    
    var listaDeMoedas: [Criptomoeda] = []
    
    var listaDePesquisa: [Criptomoeda] = []
    
    var listaSiglasFavoritas: [String] = []
  
    var listaDePreferidas: [Favoritos] = []
    
    
    
    // MARK: - Ciclo de Vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listaMoedasTable.register(UINib(nibName: "CustumTableViewCell", bundle: nil), forCellReuseIdentifier: "CustumTableViewCell")
        self.listaMoedasTable.delegate = self
        self.listaMoedasTable.dataSource = self
        self.pesquisarMoeda.delegate = self
        dataLabel.text = mostrarDataAtual()
        listaDePreferidas = moedaDAO.recuperaFavoritos()
        accessibilityFavoritos()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        request.makeRequestTelaPrincipal { (listaDeMoedas) in
            self.listaDeMoedas = listaDeMoedas
            self.listaDePesquisa = self.listaDeMoedas
            DispatchQueue.main.async {
                self.listaMoedasTable.reloadData()
            }
        }
    }

    
    // MARK: - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listaDePesquisa.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustumTableViewCell", for: indexPath) as! CustumTableViewCell
        let moedaAtual = listaDePesquisa[indexPath.row]
        cell.configuraCelula(moedaAtual)
        if listaDePreferidas.count > 0 {
            for i in 0...(listaDePreferidas.count - 1) {
                guard let sigla = listaDePreferidas[i].lista else {return cell}
                listaSiglasFavoritas.append(sigla)
            }
        }
        cell.colocaEstrela(listaSiglasFavoritas, moedaAtual)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let moedaSelecionada = listaDePesquisa[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhesMoedaSelecionada") as! DetalhesViewController
        controller.moedaSelecionada = moedaSelecionada
        show(controller, sender: self)
        listaMoedasTable.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    // MARK: - SearchBar

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaDePesquisa = listaDeMoedas
        if searchText != "" {
            let textoPesquisado = searchText
            let moedasFiltradas = listaDePesquisa.filter { $0.nome.range(of: textoPesquisado, options: [.caseInsensitive]) != nil }
            listaDePesquisa = moedasFiltradas
        }
      listaMoedasTable.reloadData()
    }
}

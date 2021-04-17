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


class MoedasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
     // MARK: - Outlets
    
    @IBOutlet weak var listaMoedas: UITableView!
    
    // MARK: - Selecao de Atributos da Classe

    var listaDeMoedas:[Criptomoeda] = []
    
  
    var moedasFavoritas: Favoritos?
    var listaDeFavoritos: [Substring] = ["BTC","LTC"]
    var listaRecarregada: [Criptomoeda] = []

    
    // MARK: - Ciclo de Vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listaMoedas.register(UINib(nibName: "CustumTableViewCell", bundle: nil), forCellReuseIdentifier: "CustumTableViewCell")
        self.listaMoedas.delegate = self
        self.listaMoedas.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
       // listaDeFavoritos = verificarFavoritos()
        makeRequest{ (resultados) in
            DispatchQueue.main.async {
                self.listaMoedas.reloadData()
            }
        }
       //recuperaDados(listaFavoritos: listaDeFavoritos)
    }
    
    // MARK: - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listaDeMoedas.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustumTableViewCell", for: indexPath) as! CustumTableViewCell
        let moedaAtual = listaDeMoedas[indexPath.row]
        cell.configuraCelula(moedaAtual)
        return cell
    }

    
    // MARK: - Request
    
    func makeRequest(completion:@escaping([Criptomoeda]) -> Void) {
        let url = URL(string: ApiRest.TodasAsMoedas)!
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                print(response as Any)
                guard let responseData = data else { return }
                do {
                    let moedas = try JSONDecoder().decode(Moedas.self, from: responseData)
                    for i in 0...5 {
                        var moedaFiltrada = moedas.filter {$0.typeIsCrypto == 1 && $0.priceUsd ?? 0>0 && (($0.idIcon?.isEmpty) != nil)}
                        guard let sigla = moedaFiltrada[i].assetID else {return}
                        guard let nome = moedaFiltrada[i].name else {return}
                        guard let valor = moedaFiltrada[i].priceUsd else {return}
                        guard let idIcon = moedaFiltrada[i].idIcon else {return}
                        let criptomoeda = Criptomoeda(sigla: sigla, nome: nome, valor: valor, imagem: idIcon)
                        self.listaDeMoedas.append(criptomoeda)
                     }
                    completion(self.listaDeMoedas)
                } catch let error {
                    print("error: \(error)")
                }
            }
        task.resume()
    }
    
    
    // MARK: - Funções
    
//    func verificarFavoritos() -> [Substring] {
//        guard let favoritos = moedasFavoritas?.lista else {return []}
//        let listaDeFavoritos = favoritos.split(separator: "|")
//        return listaDeFavoritos
//    }
//  
//
//    
//    
    
}

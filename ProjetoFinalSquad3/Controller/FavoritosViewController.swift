//
//  FavoritosViewController.swift
//  ProjetoFinalSquad3
//
//  Created by Cristiane Goncalves Uliana on 16/04/21.
//

import UIKit
import Commons

class FavoritosViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
 
    
    
    // MARK: - Outlets

    @IBOutlet weak var myCollection: UICollectionView!
    
    
    // MARK: - Variáveis
    
    var moedasFavoritas: Favoritos?
    var listaDeFavoritos: [Substring] = ["BTC","LTC"]
    var listaMoedasFavoritas: [Criptomoeda] = []
    
    
    var listaTeste: [String] = ["BTC","LTC"]
    
    // MARK: - Ciclo de Vida

    override func viewDidLoad() {
        super.viewDidLoad()
        self.myCollection.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")
        self.myCollection.delegate = self
        self.myCollection.dataSource = self
       // listaDeFavoritos = verificarFavoritos()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        recuperaDados(listaDeFavoritos)
        
    }
    

//    func verificarFavoritos() -> [Substring] {
//        guard let favoritos = moedasFavoritas?.lista else {return []}
//        let listaDeFavoritos = favoritos.split(separator: "|")
//        return listaDeFavoritos
//    }


    func recuperaDados(_ listaFavoritos: [Substring]) {
        for sigla in listaFavoritos {
            makeRequestBySigla(String(sigla)) { (resultado) in
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
}

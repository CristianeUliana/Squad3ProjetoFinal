//
//  FavoritosViewController.swift
//  ProjetoFinalSquad3
//
//  Created by Cristiane Goncalves Uliana on 16/04/21.
//

import UIKit

class FavoritosViewController: UIViewController, UICollectionViewDataSource {
  
    

    @IBOutlet weak var myCollection: UICollectionView!
    
    
    var moedasFavoritas: Favoritos?
    var listaDeFavoritos: [Substring] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaDeFavoritos = verificarFavoritos()
        myCollection.reloadData()
    }
    
    func verificarFavoritos() -> [Substring] {
        guard let favoritos = moedasFavoritas?.lista else {return []}
        let listaDeFavoritos = favoritos.split(separator: "|")
        return listaDeFavoritos
    }
  

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaDeFavoritos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFavorita = collectionView.dequeueReusableCell(withReuseIdentifier: "cellFavoritos", for: indexPath) as! CustomCollectionViewCell
        let moedaAtual = listaDeFavoritos[indexPath.item]
        celulaFavorita.configuraCelula(String(moedaAtual))
        return celulaFavorita
    }
 
 
}

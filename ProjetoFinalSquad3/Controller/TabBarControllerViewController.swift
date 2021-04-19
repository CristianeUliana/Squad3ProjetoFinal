//
//  TabBarControllerViewController.swift
//  ProjetoFinalSquad3
//
//  Created by Adalberto Sena Silva on 19/04/21.
//
import Foundation
import UIKit
import DetalhesMoedas
import Commons

class TabBarControllerViewController: UITabBarController, UITabBarControllerDelegate {

    // MARK: - Atributos
    
    var moedasFavoritas: Array<Moeda> = []
    var primeiraViewController: MoedasViewController
    var segundaViewController: FavoritosViewController
    
    init (_ primeira:MoedasViewController = MoedasViewController()){
        self.primeiraViewController = primeira
        self.segundaViewController = FavoritosViewController()
        
        print("init \(self.primeiraViewController.listaDeMoedas)")
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - NovoCiclo
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        primeiraViewController.tabBarItem = UITabBarItem(title: "Moedas", image: UIImage(named: "moedas.png"), tag: 1)
        segundaViewController.tabBarItem = UITabBarItem(title: "Favoritos", image: UIImage(named: "favoritos.png"), tag: 1)
        let ListaTabBar = [primeiraViewController, segundaViewController]
        self.tabBar.tintColor = UIColor.orange
        self.tabBar.barTintColor = UIColor.black
        self.viewControllers = ListaTabBar
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem){
        if(item.title == "Favoritos"){
            let padrao = UserDefaults.standard
            let favoritos = padrao.object(forKey: "lista") as? [String] ?? [String]()
            var moedas = [Moeda]()
            guard let favoritosMoedas = primeiraViewController.listaDeMoedas as? Array<Moeda> else {return}
            let conta = 0
            if (favoritos.count > conta){
                for item in favoritosMoedas {
                    for favoritoItem in favoritosMoedas {
                        if(item.assetID == fao){
                            
                        }
                    }
                }
            }
        }
    }

    

}

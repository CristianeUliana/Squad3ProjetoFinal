//
//  TabBarController.swift
//  ProjetoFinalSquad3
//
//  Created by Adalberto Sena Silva on 20/04/21.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // tentativa de colocar botoes de menu
//        @objc func botoesMenu(){
//
//            let tabBarBotoes = UITabBarController()
//
//            tabBarBotoes.setViewControllers([], animated: false)
//
//            let botaoMoeda = MoedasViewController()
//            let botaoFavoritos = FavoritosViewController()
//
//            botaoMoeda.title = "Moeda"
//            botaoFavoritos.title = "Favoritos"
//
//            tabBarBotoes.setViewControllers([botaoMoeda, botaoFavoritos], animated: false)
//            guard let itens = tabBarBotoes.tabBar.items else{return}
//            let imagens = ["moedas.png","favoritos.png"]
//
//            for x in 0..<itens.count {
//                itens[x].image = UIImage(systemName: imagens[x])
//            }
//            tabBarBotoes.modalPresentationStyle = .fullScreen
//            present(tabBarBotoes, animated: true)
//
//        }

    override func viewDidAppear(_ animated: Bool) {
        let tabBarVC = self
        let listaMoedasPrincipal = UINavigationController(rootViewController: MoedasViewController())
        let favoriteListVC = UINavigationController(rootViewController: FavoriteListVC())
        favoriteListVC.title = "Adicionadas"
        
        tabBarVC.setViewControllers([listaMoedasPrincipal,favoriteListVC], animated: false)
        
        guard let items = tabBarVC.tabBar.items else  { return }
        
        let images = ["dollarsign.circle.fill", "star.fill"]
        for index in 0..<items.count {
            items[index].image = UIImage(systemName: images[index])
        }
    }
}

class FavoriteListVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Adicionadas"
        self.navigationController?.isNavigationBarHidden = true
        
        let viewController = FavoritosViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
    
    


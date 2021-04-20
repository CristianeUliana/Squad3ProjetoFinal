//
//  ViewController.swift
//  ProjetoFinalSquad3
//
//  Created by Adalberto Sena Silva on 20/04/21.
//

import UIKit
import Commons
class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
        // tentativa de colocar botoes de menu

        override func viewDidAppear(_ animated: Bool){
            
            let tabBarControl = self
            let moedasViewController = UINavigationController(rootViewController: MoedasViewController())
            let favoritosViewController = UINavigationController(rootViewController: ListaDeFavoritos())
            favoritosViewController.title = "Adicionados"
            
            tabBarControl.setViewControllers([moedasViewController, favoritosViewController], animated: false)
            
            guard let item = tabBarControl.tabBar.items else {return}
            
            let imagens = ["favoritos.png"]
            for cont in 0..<item.count {
                item[cont].image = UIImage(systemName: imagens[cont])
            }
            
        }

}

class ListaDeFavoritos: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Adicionados"
        self.navigationController?.isNavigationBarHidden = true
        
        
        let viewControl = FavoritosViewController()
        
        self.navigationController?.pushViewController(viewControl, animated: true)
    }
}

//
//  HeaderColor.swift
//  Alamofire
//
//  Created by Leonardo Oliveira Portes on 15/04/21.
//

import Foundation

import Foundation
import UIKit

    // MARK: Header Cores

public struct HeaderCores {
        public static let headerColor = UIColor(red: 0.55, green:0.59, blue:0.37, alpha: 1)
}

    // MARK: Fonte Header Título e Subtitulo

public struct Font {
       public static let header = UIFont(name: "AvenirLTStd-Black", size: 20.0)!
       public static let subHeader = UIFont(name: "AvenirLTStd-Light", size: 16.0)!
    }

//    // MARK: Button -> Será usado no Módulo de Detalhes.
//public struct Button {
//
//public static var centralButton: UIButton = {
//    let button = UIButton(frame: CGRect(x: 100, y: 100, width: 180, height: 40))
//    button.backgroundColor = UIColor(red: 0.55, green:0.59, blue:0.37, alpha: 1)
//    button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
//    button.layer.cornerRadius = 10
//    button.layer.borderWidth = 1
//    button.layer.borderColor = UIColor.white.cgColor
//
//    return button
//    }()
//}

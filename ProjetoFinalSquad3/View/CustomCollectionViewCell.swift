//
//  CustomCollectionViewCell.swift
//  ProjetoFinalSquad3
//
//  Created by Cristiane Goncalves Uliana on 16/04/21.
//

import UIKit
import Commons

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nomeMoeda: UILabel!
    @IBOutlet weak var siglaMoeda: UILabel!
    @IBOutlet weak var valorMoeda: UILabel!
    @IBOutlet weak var imagemMoeda: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configuraCelula(_ teste: String) {
        
    }
    
    
//    func configuraCelula(_ moeda: Criptomoeda) {
//
//        nomeMoeda.text = moeda.nome
//        siglaMoeda.text = moeda.sigla
//        valorMoeda.text = String(moeda.valor)
//
//        let caminhoIcon = moeda.imagem
//        let id = caminhoIcon.replacingOccurrences(of: "-", with: "")
//        let url = ApiRest.UrlIcon.replacingOccurrences(of: "@@@", with: id)
//        guard let urlCompleta = URL(string: url) else {return}
//        imagemMoeda.af.setImage(withURL: urlCompleta)
//
//    }
}

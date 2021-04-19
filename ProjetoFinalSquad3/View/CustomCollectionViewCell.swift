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

    
    
    func configuraCelula(_ moeda: Criptomoeda) {
        layer.cornerRadius = 8
        
        
        CGSize(width: 100, height: 400)
        nomeMoeda.text = moeda.nome
        siglaMoeda.text = moeda.sigla
        valorMoeda.text = moeda.valor.formatador()
        let caminhoIcon = moeda.imagem
        let id = caminhoIcon.replacingOccurrences(of: "-", with: "")
        let url = ApiRest.UrlIcon.replacingOccurrences(of: "@@@", with: id)
        guard let urlCompleta = URL(string: url) else {return}
        //imagemMoeda.af.setImage(withURL: urlCompleta)
    }
    
}

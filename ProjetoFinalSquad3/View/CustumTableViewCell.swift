//
//  CustumTableViewCell.swift
//  ProjetoFinalSquad3
//
//  Created by Adalberto Sena Silva on 13/04/21.
//
import Commons
import UIKit

class CustumTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var imagemCriptomoeda: UIImageView!
    @IBOutlet weak var imagemDeFavoritos: UIImageView!
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var siglaLabel: UILabel!
    @IBOutlet weak var cotacaoLabel: UILabel!
    
    
    // MARK: - Variáveis
    
    var moedasFavoritas: Favoritos?
    var moedasFavoritasTeste = "BTC|USD|ETH|FRE"

    // MARK: - Funções
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configuraCelula(_ moeda: Criptomoeda) {
        bitcoinLabel.text = moeda.nome
        siglaLabel.text = moeda.sigla
        cotacaoLabel.text = String(moeda.valor)
        let caminhoIcon = moeda.imagem
        let id = caminhoIcon.replacingOccurrences(of: "-", with: "")
        let url = ApiRest.UrlIcon.replacingOccurrences(of: "@@@", with: id)
        guard let urlCompleta = URL(string: url) else {return}
        imagemCriptomoeda.af.setImage(withURL: urlCompleta)
        guard let favoritos = moedasFavoritas?.lista else {return}
        let listaDeFavoritos = favoritos.split(separator: "|")
         //let listaDeFavoritos = moedasFavoritasTeste.split(separator: "|")
        if listaDeFavoritos.contains(Substring(moeda.sigla)) {
            imagemDeFavoritos.image = UIImage(named: "estrela")
        }
    }
}

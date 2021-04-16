//
//  CustomCollectionViewCell.swift
//  ProjetoFinalSquad3
//
//  Created by Cristiane Goncalves Uliana on 16/04/21.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nomeMoeda: UILabel!
    
    @IBOutlet weak var siglaMoeda: UILabel!
    
    @IBOutlet weak var valorMoeda: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configuraCelula(_ moeda: String) {
        
        
    }
}

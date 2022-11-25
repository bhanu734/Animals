//
//  factsCollectionViewCell.swift
//  Animalsapp
//
//  Created by Mac on 21/11/22.
//

import UIKit

class factsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var factlabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func configureUI(animalfact: String?) {
        factlabel.text = animalfact
    }
}

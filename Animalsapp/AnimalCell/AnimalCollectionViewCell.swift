//
//  AnimalCollectionViewCell.swift
//  Animalsapp
//
//  Created by Mac on 13/11/22.
//

import UIKit

class AnimalCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var animalName: UILabel!
    @IBOutlet weak var animalCaption: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        animalImage.layer.cornerRadius = 10.0
    }
    func configureUI(animal: Animal) {
        animalImage.image = UIImage(named: animal.image ?? "")
        animalName.text = animal.name
        animalCaption.text = animal.headline
        
    }
    
    func configureUI_watchview(animal: Animal) {
        animalImage.image = UIImage(named: animal.image ?? "")
        animalName.text = animal.name
        animalCaption.text = animal.headline
        
    }
}

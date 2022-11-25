//
//  ImageCollectionViewCell.swift
//  Animalsapp
//
//  Created by Mac on 16/11/22.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var heroimage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
        func configureUI(animal: Animal) {
            heroimage.image = UIImage(named: animal.coverImage ?? "")
            
        }
    
    func configureUI_DVC(animalimage: String?) {
        heroimage.layer.cornerRadius = 10.0
        heroimage.image = UIImage(named: animalimage ?? "")
        
    }
        
    
        func configureUI_img(animal: Animal) {
            heroimage.layer.cornerRadius = 10.0
            heroimage.image = UIImage(named: animal.image ?? "")
    }
    func configureUI_watchview(animal: Animal) {
        heroimage.layer.cornerRadius = 10.0
        heroimage.image = UIImage(named: animal.image ?? "")
        
    }
}

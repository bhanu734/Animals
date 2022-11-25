//
//  WatchCollectionViewCell.swift
//  Animalsapp
//
//  Created by Mac on 15/11/22.
//

import UIKit

class WatchCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var watchanimalImage: UIImageView!
    @IBOutlet weak var watchanimalName: UILabel!
    @IBOutlet weak var watchanimalCaption: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        
        watchanimalImage.layer.cornerRadius = 10.0
        
    }

    func configureUI_watchview(animal: Animal) {
        watchanimalImage.image = UIImage(named: animal.image ?? "")
        watchanimalName.text = animal.name
        watchanimalCaption.text = animal.headline
        
    }
}

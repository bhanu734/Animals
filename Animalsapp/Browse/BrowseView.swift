//
//  BrowseView.swift
//  Animalsapp
//
//  Created by Mac on 14/11/22.
//

import Foundation
import UIKit

enum HomeType {
    case square2x2
    case square2x3
    case square2x1
    case squarexHero
}

protocol BrowseViewDelegate {
    func animalSelected(animal: Animal?)

}


class BrowseView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var leftButtonImage: UIImageView!
    @IBOutlet weak var rightButtonImage: UIImageView!
    
    var animals: [Animal] = []
    var coverAnimals: [Animal] = []
    var square2x2 = ""
    var square2x3 = ""
    var square2x1 = ""
    var hometype : HomeType = .squarexHero
    var delegate: BrowseViewDelegate?
    
    func setupUI() {
        
        collectionView.register(UINib(nibName: "HeroCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HeroCollectionViewCell")
        
        collectionView.register(UINib(nibName: "AnimalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AnimalCollectionViewCell")
        collectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    }
    func updateUI() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    @IBAction func leftButtonTapped() {
        leftButtonImage.tintColor = UIColor.init(named: "AppColor")
        rightButtonImage.tintColor = UIColor.black
        hometype = .squarexHero
        updateUI()
    }
    @IBAction func rightButtonTapped() {
        rightButtonImage.tintColor = UIColor.init(named: "AppColor")
        leftButtonImage.tintColor = UIColor.black
        
        if hometype == .squarexHero{
            
            hometype = .square2x3
        }else if hometype == .square2x3 {
            
            hometype = .square2x2
        } else if hometype == .square2x2 {
            
            hometype = .square2x1
        }
        
        updateUI()
    }
    
}
extension BrowseView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if hometype == .squarexHero{
            return 2

        }else if hometype == .square2x3 || hometype == .square2x2 || hometype == .square2x1 {
            return 1
        }
        else {
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if hometype == .squarexHero {
            if section == 0 {
                return 1
            }else {
                return animals.count
            }
        }else if hometype == .square2x3 || hometype == .square2x2 || hometype == .square2x1 {
            return animals.count
        }else  {
                return 0
        }
        
       
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if hometype == .squarexHero {
            if indexPath.section == 0 {
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroCollectionViewCell", for: indexPath) as? HeroCollectionViewCell {
                    cell.delegate = self
                    cell.configureUI(coverAnimals: coverAnimals)
                    return cell
                }
                
            }else {
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimalCollectionViewCell", for: indexPath) as? AnimalCollectionViewCell {
                    cell.configureUI(animal: animals[indexPath.row])
                    return cell
            }
            
            }
        }else if hometype == .square2x3 || hometype == .square2x2 || hometype == .square2x1 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell {
                cell.configureUI_img(animal: animals[indexPath.row])
                return cell
            }
        }else {
            return UICollectionViewCell()
        }
       
        return UICollectionViewCell()
    }
}
extension BrowseView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if hometype == .squarexHero {
            if indexPath.section == 0 {
                return CGSize(width: collectionView.frame.width, height: 300)
            }else {
                return CGSize(width: collectionView.frame.width, height: 120)
            }
        }else if hometype == .square2x3{
            return CGSize(width: (collectionView.frame.width-21)/3, height: (collectionView.frame.width-21)/3*0.6)
        } else if hometype == .square2x2 {
            return CGSize(width: (collectionView.frame.width-10)/2, height:(collectionView.frame.width-10)/2*0.6)
        
        } else if hometype == .square2x1  {
            return CGSize(width: collectionView.frame.width, height: 240)
        
        }else {
            return CGSize.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.animalSelected(animal: animals[indexPath.row])
    }
    }


extension BrowseView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if hometype == .square2x3 {
            return 10
        } else if hometype == .square2x2 {
            return 10
        }else if hometype == .square2x1 {
            return 10
        }else{
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if hometype == .square2x3 || hometype == .square2x2 || hometype == .square2x1 {
            return 10
        } else {
            return 0
        }
    }
}
extension BrowseView: HeroCollectionViewCellDelegate {
    func animalTapped(animal: Animal?) {
        delegate?.animalSelected(animal: animal)
    }
    
    
}

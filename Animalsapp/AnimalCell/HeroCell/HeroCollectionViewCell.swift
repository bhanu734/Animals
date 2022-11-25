//
//  HeroCollectionViewCell.swift
//  Animalsapp
//
//  Created by Mac on 16/11/22.
//

import UIKit

protocol HeroCollectionViewCellDelegate {
    func animalTapped(animal: Animal?)
}

class HeroCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var heroCollectionView: UICollectionView!
    @IBOutlet weak var pagecontrol: UIPageControl!
    var coverAnimals: [Animal] = []
    var currentPage : Int = 0
    var delegate: HeroCollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pagecontrol.currentPageIndicatorTintColor = UIColor.blue
        pagecontrol.pageIndicatorTintColor = UIColor.white
        
        heroCollectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        heroCollectionView.dataSource = self
        heroCollectionView.delegate = self
        
        
    }

    func configureUI(coverAnimals: Animals) {
        self.coverAnimals = coverAnimals
    
        DispatchQueue.main.async {
        self.pagecontrol.numberOfPages = coverAnimals.count
        self.heroCollectionView.reloadData()
        }
    
    }
}

extension HeroCollectionViewCell: UICollectionViewDataSource {

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coverAnimals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = heroCollectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell {
            cell.configureUI(animal: coverAnimals[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell()
    }
    
}

extension HeroCollectionViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.animalTapped(animal: coverAnimals[indexPath.row])
    }
}

extension HeroCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:collectionView.frame.width , height: 230)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension HeroCollectionViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x)/394
        
//        print(scrollView.contentOffset.x)
        if self.currentPage != currentPage {
            
            self.currentPage = currentPage
            pagecontrol.currentPage = currentPage
        }
    }
}

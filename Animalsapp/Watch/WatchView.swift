//
//  WatchView.swift
//  Animalsapp
//
//  Created by Mac on 15/11/22.
//

import UIKit

class WatchView: UIView {

    @IBOutlet weak var watchCollectionview : UICollectionView!
    
    
    var watchanimals: [Animal] = []
    

    func setupUI() {
        
    
        watchCollectionview.register(UINib(nibName: "WatchCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "WatchCollectionViewCell")
        
        watchCollectionview.delegate = self
        watchCollectionview.dataSource = self
    }
    func updateUI() {
        DispatchQueue.main.async {
            self.watchCollectionview.reloadData()
        }
    }

}
extension WatchView: UICollectionViewDelegate{

}
extension WatchView: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return watchanimals.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = watchCollectionview.dequeueReusableCell(withReuseIdentifier: "WatchCollectionViewCell", for: indexPath) as? WatchCollectionViewCell{
            cell.configureUI_watchview(animal: watchanimals[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}
extension WatchView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: watchCollectionview.frame.width, height: 110)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}

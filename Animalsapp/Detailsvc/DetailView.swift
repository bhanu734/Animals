//
//  DetailView.swift
//  Animalsapp
//
//  Created by Mac on 19/11/22.
//

import UIKit

protocol DetailViewDelegate {
    func backTapped()
}

class DetailView: UIView {

    @IBOutlet weak var animalid: UILabel!
    @IBOutlet weak var animalimage: UIImageView!
    @IBOutlet weak var animalname:  UILabel!
    @IBOutlet weak var animalheading: UITextView!
    @IBOutlet weak var Animalimagecollectionview: UICollectionView!
    @IBOutlet weak var factscollectionview: UICollectionView!
    @IBOutlet weak var animaldescription: UITextView!
    @IBOutlet weak var wikipediabutton: UIButton!
    @IBOutlet weak var allabout:  UILabel!

    var animal: Animal?
    var delegate : DetailViewDelegate?
    
    func setupUI() {
        
        Animalimagecollectionview.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        
        Animalimagecollectionview.register(UINib(nibName: "factsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "factsCollectionViewCell")
        factscollectionview.layer.cornerRadius = 10.0
        
        Animalimagecollectionview.delegate = self
        Animalimagecollectionview.dataSource = self
        
        factscollectionview.delegate = self
        factscollectionview.dataSource = self
        
        animalid.text = animal?.id
        animalimage.image = UIImage(named: animal?.image ?? "")
        animalname.text = animal?.name
        animalheading.text = animal?.headline
        animaldescription.text = animal?.animalDescription
        allabout.text = "All About" + (animal?.name ?? "" )
    }
    @IBAction func wikilinkTapped() {
        if let urlString = animal?.link {
            guard let url = URL(string: urlString) else {return}
            UIApplication.shared.openURL(url)
        }
    }
    
    @IBAction func backTapped() {
        delegate?.backTapped()
    }
}

extension DetailView: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == Animalimagecollectionview{
            return animal?.gallery?.count ?? 0
        } else {
            return animal?.fact?.count ?? 0
        }
       
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == Animalimagecollectionview {
            if let cell = Animalimagecollectionview.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell {
                cell.configureUI_DVC(animalimage: animal?.gallery?[indexPath.row])
                return cell
            }
        } else {
            if let cell = Animalimagecollectionview.dequeueReusableCell(withReuseIdentifier: "factsCollectionViewCell", for: indexPath) as? factsCollectionViewCell {
                cell.configureUI(animalfact: animal?.fact?[indexPath.row])
                return cell
            }
        }
                
        return UICollectionViewCell()
    }
}

extension DetailView: UICollectionViewDelegate{
    
}

extension DetailView: UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == Animalimagecollectionview{
        return CGSize(width: (Animalimagecollectionview.frame.width-30), height: (Animalimagecollectionview.frame.width-30)*5/8)
        } else {
            return CGSize(width: factscollectionview.frame.width, height: factscollectionview.frame.width)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == Animalimagecollectionview{
            return 10
        }else {
            return 0
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView == Animalimagecollectionview{
            return 10
        }else {
            return 0
        }
    }
}

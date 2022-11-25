//
//  BrowseViewController.swift
//  Animalsapp
//
//  Created by Mac on 13/11/22.
//

import UIKit

class BrowseViewController: UIViewController {

    @IBOutlet weak var browseView: BrowseView!
    var browsemodel : BrowseModel = BrowseModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        browseView.delegate = self
        
        browseView.setupUI()
        browsemodel.getData()
        
        let data = browsemodel.animals
        browseView.animals = data
        
        let coverAnimaldata = browsemodel.coverAnimals
        browseView.coverAnimals = coverAnimaldata
        
        browseView.updateUI()
    }


}
extension BrowseViewController: BrowseViewDelegate{
    func animalSelected(animal: Animal?) {
        let detailvc = DetailViewController(nibName: "DetailViewController", bundle: nil)
        detailvc.detailmodel.animal = animal
        navigationController?.pushViewController(detailvc, animated: true)
    }
    

}

//
//  DetailViewController.swift
//  Animalsapp
//
//  Created by Mac on 19/11/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailview: DetailView!
    var detailmodel: DetailModel = DetailModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        detailview.delegate = self
        
        let data = detailmodel.animal
        detailview.animal = data
        
        detailview.setupUI()
        
    }

}
extension DetailViewController: DetailViewDelegate{
    func backTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    
}

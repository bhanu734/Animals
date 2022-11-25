//
//  WatchViewController.swift
//  Animalsapp
//
//  Created by Mac on 13/11/22.
//

import UIKit

class WatchViewController: UIViewController {

    @IBOutlet weak var watchView: WatchView!
    var watchmodel : WatchModel = WatchModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        watchView.setupUI()
        watchmodel.getdata()
        
        let data = watchmodel.watchanimals
        watchView.watchanimals = data
        
        watchView.updateUI()
    }


    

}

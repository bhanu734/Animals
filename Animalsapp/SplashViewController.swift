//
//  SplashViewController.swift
//  Animalsapp
//
//  Created by Mac on 12/11/22.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let tabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TabBarViewController")
        navigationController?.pushViewController(tabBarController, animated: false)
    }
    

}

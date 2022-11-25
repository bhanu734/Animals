//
//  WatchModel.swift
//  Animalsapp
//
//  Created by Mac on 15/11/22.
//

import Foundation

class WatchModel {
    
    var watchanimals: [Animal] = []
    
    func getdata() {
        
        watchanimals = Bundle.main.decode("animals.json")
    }
}

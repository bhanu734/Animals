//
//  BrowseModel.swift
//  Animalsapp
//
//  Created by Mac on 14/11/22.
//

import Foundation

class BrowseModel {
    
    var animals: [Animal] = []
    var coverAnimals: [Animal] = []
    
    func getData() {
        
        animals = Bundle.main.decode("animals.json")
        coverAnimals = Bundle.main.decode("covers.json")
    }
}

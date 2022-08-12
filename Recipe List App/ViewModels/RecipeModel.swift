//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Sohaib Ahmed on 11/08/2022.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipies = [Recipe]()
    @Published var tabIndex = 0;
    
    init() {
        let service = DataService()
        self.recipies = service.getLocalData()
    }
}

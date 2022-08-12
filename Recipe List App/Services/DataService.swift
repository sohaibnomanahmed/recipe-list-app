//
//  DataService.swift
//  Recipe List App
//
//  Created by Sohaib Ahmed on 11/08/2022.
//

import Foundation

class DataService {
    
    func getLocalData() -> [Recipe] {
        
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // check thet pathstring is not nil, a guard statement is making sure something is true before continuing
        guard pathString != nil else {
            return [Recipe]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            let recipeData = try decoder.decode([Recipe].self, from: data)
            
            for r in recipeData {
                r.id = UUID()
            }
            
            return recipeData
        } catch {
            print(error)
        }
        
        return [Recipe]()
    }
    
}

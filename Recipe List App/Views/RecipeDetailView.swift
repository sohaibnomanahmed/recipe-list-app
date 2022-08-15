//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Sohaib Ahmed on 11/08/2022.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe:Recipe // if unset the creator will require it
    
    var body: some View {
        ScrollView{
            
            ZStack(alignment: .bottomLeading) {
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                .scaledToFill()
                
                Text(recipe.name)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .padding(.all, 5.0)
                    
                    
            }
            
            VStack(alignment: .leading){
                // MARK: Recipe Ingridients
                Text("Ingridients")
                    .font(.headline)
                    .padding(.bottom, 5)
                
                ForEach(recipe.ingredients){ item in
                    Text("· " + item.name)
                }
                
                Divider()
                
                // MARK: Recipe Direction
                Text("Directions")
                    .font(.headline)
                    .padding(.vertical, 5)
                
                ForEach(0..<recipe.directions.count, id: \.self){ index in
                    Text(String(index + 1) + ". " + recipe.directions[index])
                        .padding(.bottom, 5)
                }
            }.padding(.horizontal)
                //.navigationBarTitle(recipe.name)
        }.ignoresSafeArea()
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipies[0])
    }
}

//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Sohaib Ahmed on 12/08/2022.
//

import SwiftUI

struct RecipeTabView: View {
    
    var body: some View {
        // bindings
        TabView{
            RecipeFeaturedView()
                .tabItem{
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Features")
                    }
                }
            
            RecipeListView()
                .tabItem{
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        }.environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}

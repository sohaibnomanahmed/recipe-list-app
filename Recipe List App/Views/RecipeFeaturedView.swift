//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Sohaib Ahmed on 15/08/2022.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                GeometryReader { geo in
                    TabView {
                        ForEach(0..<model.recipies.count, id: \.self){ index in
                        if model.recipies[index].featured {
                            NavigationLink (
                                destination: RecipeDetailView(recipe:  model.recipies[index]),
                                label: {
                                    ZStack {
                                        Rectangle()
                                            .foregroundColor(.white)
                                        
                                        VStack(spacing: 0){
                                            Image(model.recipies[index].image)
                                                .resizable()
                                                .clipped()
                                                .aspectRatio(contentMode: .fill)
                                            Text(model.recipies[index].name)
                                                .padding()
                                        }
                                    }
                                    .frame(width: geo.size.width - 40 , height: geo.size.height - 120, alignment: .center)
                                    .cornerRadius(15)
                                    .shadow(radius: 10)
                                }
                            )
                        }
                        }
                        
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                }
                VStack(alignment: .leading, spacing: 5){
                    Text("Preperation Time:")
                        .font(.headline)
                    Text("1 Hour")
                    Text("Highlights")
                        .font(.headline)
                    Text("Featured Recipe")
                }
                .padding()
            }.navigationTitle("Featured Views")
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}

//
//  CocktailDetailView.swift
//  LetsMakeACocktail
//
//  Created by Максим Самороковский on 11.03.2024.
//

import SwiftUI

struct CocktailDetailView: View {
    var cocktail: Cocktail
    
    var body: some View {
            VStack {
                Text("Ingredients:")
                    .padding(5)
                    .font(.headline)
                    .background(.blue)
                    .clipShape(.capsule)
                    .padding(.top, 10)
                ForEach(cocktail.ingredients, id: \.self) { ingredient in
                    Text(ingredient)
                        .padding(.top, 10)
                }
                .padding(.horizontal)
                Spacer()
            }
            .navigationTitle(cocktail.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}

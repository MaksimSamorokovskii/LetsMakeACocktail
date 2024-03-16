//
//  ContentView.swift
//  LetsMakeACocktail
//
//  Created by Максим Самороковский on 11.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var cocktails: [Cocktail] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                List(cocktails) { cocktail in
                    NavigationLink(destination: CocktailDetailView(cocktail: cocktail)) {
                        Text(cocktail.name)
                    }
                }
                .navigationTitle("Cocktail recipes")
            }
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) { searchText, _ in
            if searchText.isEmpty {
                self.cocktails.removeAll()
            } else {
                fetchCocktails()
            }
        }

    }
    
    func fetchCocktails() {
        CocktailService.shared.fetchCocktails(withName: searchText) { fetchedCocktails in
            DispatchQueue.main.async {
                self.cocktails = fetchedCocktails ?? []
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  Cocktail.swift
//  LetsMakeACocktail
//
//  Created by Максим Самороковский on 11.03.2024.
//

import Foundation

class Cocktail: Decodable, Identifiable {
    var name: String
    var ingredients: [String]
    var instructions: String

    init(name: String, ingredients: [String], instructions: String) {
        self.name = name
        self.ingredients = ingredients
        self.instructions = instructions
    }
}

//
//  CocktailService.swift
//  LetsMakeACocktail
//
//  Created by Максим Самороковский on 16.03.2024.
//

import Foundation

class CocktailService {
    static let shared = CocktailService()
    private let apiKey = "kTeqiWKhxQkQ0StOxn/fIw==3Fn0KRcHRkrVq4wm"
    
    func fetchCocktails(withName name: String, completion: @escaping ([Cocktail]?) -> Void) {
        guard let encodedName = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            completion(nil)
            return
        }
        
        let url = URL(string: "https://api.api-ninjas.com/v1/cocktail?name=\(encodedName)")!
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let cocktails = try JSONDecoder().decode([Cocktail].self, from: data)
                completion(cocktails)
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }
}

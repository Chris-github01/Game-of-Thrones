//
//  GOTNetworkManager.swift
//  Game of Thrones Chris
//
//  Created by Christopher Knight on 2023/02/11.
//

import Foundation

class GOTNetworkManager : ObservableObject{
    
    static let shared = GOTNetworkManager()
    @Published var gotData: CharacterData?
    @Published var selectedCharcter: Character? = nil
    
    func fetchGOTDetails(completion: @escaping (CharacterData?) -> Void) {
        let urlString = "https://thronesapi.com/api/v2/Characters"
        guard let url = URL(string: urlString) else {return}
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with:request) {data, response, error in
            if let safedData = data {
                let character = try? JSONDecoder().decode(CharacterData.self, from: safedData)
                completion(character)
            }
        }
        task.resume()
    }
}

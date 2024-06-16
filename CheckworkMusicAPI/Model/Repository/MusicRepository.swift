//
//  MusicRepository.swift
//  CheckworkMusicAPI
//
//  Created by Owner on 2024/06/12.
//

import Foundation

class MusicRepository {
        
    static func requestMusic(keyword: String) async -> MusicResponse? {
        let urlString = "https://itunes.apple.com/search?term=\(keyword)&entity=song&country=JP&lang=ja_jp&limit=20"
        guard let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return nil }
        guard let url = URL(string: encodedUrlString) else { return nil }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse else { return nil }
            
            if httpResponse.statusCode == 200 {
                let decodedData = try JSONDecoder().decode(MusicResponse.self, from: data)
                return decodedData
            } else {
                return nil
            }
            
        } catch {
            print(error)
            return nil
        }
    }
    
}

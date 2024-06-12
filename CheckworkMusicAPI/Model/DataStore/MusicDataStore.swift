//
//  MusicDataStore.swift
//  CheckworkMusicAPI
//
//  Created by Owner on 2024/06/12.
//

import Foundation

class MusicDataStore: ObservableObject {
    
    @Published private(set) var musics: [Music] = []
    
    init(musics: [Music]) {
        self.musics = musics
    }
    
    func setMusics(musics: [Music]) {
        self.musics = musics
    }
    
}

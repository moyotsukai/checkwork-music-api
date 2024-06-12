//
//  MusicListView.swift
//  CheckworkMusicAPI
//
//  Created by Owner on 2024/06/12.
//

import SwiftUI

struct MusicListView: View {
    
    @ObservedObject var musicDataStore: MusicDataStore
    
    var body: some View {
        List(musicDataStore.musics, id: \.trackName) {
            Text($0.trackName)
        }
        .listStyle(.plain)
    }
}

#Preview {
    MusicListView(musicDataStore: MusicDataStore(musics: []))
}

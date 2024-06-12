//
//  ContentView.swift
//  CheckworkMusicAPI
//
//  Created by Owner on 2024/06/12.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var musicDataStore: MusicDataStore
    
    var body: some View {
        VStack {
            Spacer(minLength: 16)
            SearchBar(musicDataStore: musicDataStore)
            MusicListView(musicDataStore: musicDataStore)
        }
    }
}

#Preview {
    ContentView(musicDataStore: MusicDataStore(musics: []))
}

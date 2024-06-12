//
//  SearchBar.swift
//  CheckworkMusicAPI
//
//  Created by Owner on 2024/06/12.
//

import SwiftUI

struct SearchBar: View {
    
    @ObservedObject var musicDataStore: MusicDataStore
    @State private var searchKeyword: String = ""
    
    func onSubmitSearchText() {
        Task {
            guard let musicResponse = await MusicRepository.shared.requestMusic(keyword: searchKeyword) else { return }
            musicDataStore.setMusics(musics: musicResponse.results)
        }
    }
    
    var body: some View {
        TextField("曲を検索", text: $searchKeyword)
            .onSubmit(onSubmitSearchText)
            .padding(EdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 10))
            .background(.secondary.opacity(0.2), in: Capsule())
            .padding(.horizontal, 16)
            .keyboardType(.webSearch)
    }
}

#Preview {
    SearchBar(musicDataStore: MusicDataStore(musics: []))
}

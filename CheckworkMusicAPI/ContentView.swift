//
//  ContentView.swift
//  CheckworkMusicAPI
//
//  Created by Owner on 2024/06/12.
//

import SwiftUI

struct ContentView: View {
    
    @State var musics: [Music] = []
    @State private var searchKeyword: String = ""
    
    func onSubmitSearchText() {
        Task {
            //データをフェッチ
            let urlString = "https://itunes.apple.com/search?term=\(searchKeyword)&entity=song&country=JP&lang=ja_jp&limit=20"
            guard let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
            guard let url = URL(string: encodedUrlString) else { return }
            do {
                let (data, response) = try await URLSession.shared.data(from: url)
                guard let httpResponse = response as? HTTPURLResponse else { return }
                if httpResponse.statusCode == 200 {
                    let musicResponse = try JSONDecoder().decode(MusicResponse.self, from: data)
                    //データをセット
                    musics = musicResponse.results
                }
            } catch {
                //エラー
                print(error)
                return
            }
        }
    }
    
    var body: some View {
        VStack {
            Spacer(minLength: 16)
            TextField("曲を検索", text: $searchKeyword)
                .onSubmit(onSubmitSearchText)
                .padding(EdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 10))
                .background(.secondary.opacity(0.2), in: Capsule())
                .padding(.horizontal, 16)
                .keyboardType(.webSearch)
            List(musics, id: \.trackName) {
                Text($0.trackName)
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    ContentView()
}

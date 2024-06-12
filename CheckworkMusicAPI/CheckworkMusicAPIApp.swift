//
//  CheckworkMusicAPIApp.swift
//  CheckworkMusicAPI
//
//  Created by Owner on 2024/06/12.
//

import SwiftUI

@main
struct CheckworkMusicAPIApp: App {
    
    @StateObject var musicDataStore = MusicDataStore(musics: [])
    
    var body: some Scene {
        WindowGroup {
            ContentView(musicDataStore: musicDataStore)
        }
    }
}

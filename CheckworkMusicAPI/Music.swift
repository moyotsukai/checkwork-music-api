//
//  Music.swift
//  CheckworkMusicAPI
//
//  Created by Owner on 2024/06/12.
//

import Foundation

struct Music: Codable {
    var trackName: String
}

struct MusicResponse: Codable {
    var results: [Music]
}

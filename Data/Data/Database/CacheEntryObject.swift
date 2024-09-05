//
//  File.swift
//  Data
//
//  Created by Christos Kaktsis on 5/9/24.
//

import Foundation

enum CacheEntry {
    case inProgress(Task<PokemonEntryResponse, Error>)
    case ready(PokemonEntryResponse)
}

final class CacheEntryObject {
    let entry: CacheEntry
    init(entry: CacheEntry) { self.entry = entry }
}

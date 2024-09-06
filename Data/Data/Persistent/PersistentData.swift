//
//  PersistentData.swift
//  Data
//
//  Created by Christos Kaktsis on 5/9/24.
//

import SwiftData

@Model
final class DatabasePokemon {
    public var id: Int
    public let name: String
    public let url: String
    
    public init(id: Int, name: String, url: String) {
        self.id = id
        self.name = name
        self.url = url
    }
}

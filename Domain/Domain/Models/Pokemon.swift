//
//  Pokemon.swift
//  Domain
//
//  Created by Christos Kaktsis on 25/6/24.
//

import Foundation

public struct Pokemon {
    public var id: UUID = .init()
    public let name: String
    public let url: String
    
    public var imageUrl: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(url.split(separator: "/").last ?? "1").png"
        
    }
    
    public init(id: UUID, name: String, url: String) {
        self.id = id
        self.name = name
        self.url = url
    }
}

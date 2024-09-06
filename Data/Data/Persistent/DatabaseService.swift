//
//  DatabaseService.swift
//  Data
//
//  Created by Christos Kaktsis on 6/9/24.
//

import Foundation
import SwiftData

class DatabaseService{
    static var shared = DatabaseService()
    var container: ModelContainer?
    var context: ModelContext?
    
    init() {
        do {
            container = try ModelContainer(for: DatabasePokemon.self)
            if let container {
                context = ModelContext(container)
            }
        } catch {
            print(error)
        }
    }
    
    func savePokemon(pokemon: DatabasePokemon?){
        guard let pokemon else { return }
        if let context {
            context.insert(pokemon)
        }
    }
    
    func fetchPokemons(onCompletion: @escaping([DatabasePokemon]?, Error?) -> (Void)) {
        let descriptor = FetchDescriptor<DatabasePokemon>(sortBy: [SortDescriptor<DatabasePokemon>(\.id)])
        if let context {
            do {
                let data = try context.fetch(descriptor)
                onCompletion(data,nil)
            } catch {
                onCompletion(nil,error)
            }
        }
    }
    
    func getPokemons() -> [DatabasePokemon] {
        var pokemons: [DatabasePokemon] = []
        fetchPokemons { data, error in
            if let error{
                print(error)
            }
            if let data {
                pokemons = data
            }
        }
        
        return pokemons
    }
}

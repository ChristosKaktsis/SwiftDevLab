//
//  Counter.swift
//  Data
//
//  Created by Christos Kaktsis on 5/9/24.
//

//An actor protects its properties by ensuring that only a single thread can access the data at any given time.
//This protection ensures safe access to the counter from concurrent contexts.

import Foundation

actor Counter {
    var count: Int = 0


    func increment() {
        count = count + 1
    }
}

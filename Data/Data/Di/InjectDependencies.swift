//
//  InjectDependencies.swift
//  Data
//
//  Created by Christos Kaktsis on 2/8/24.
//

import Foundation
import Domain

private struct RemoteDataSourceProviderKey: InjectionKey {
    static var currentValue: RemoteDataSoureProtocol = RemoteDataSource()
}

extension InjectedValues {
    public var remoteDataSourceProvider: RemoteDataSoureProtocol {
        get { Self[RemoteDataSourceProviderKey.self] }
        set { Self[RemoteDataSourceProviderKey.self] = newValue }
    }
}

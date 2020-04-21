//
//  ApolloClient+EK.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 18.02.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import Apollo
import SwiftUI

extension ApolloClient: EnvironmentKey {
  public static let defaultValue: ApolloClient = {
    let networkTransport = HTTPNetworkTransport(
      url: URL(string: "http://localhost:8000/graphql")!,
      session: URLSession.shared
    )
    let store = ApolloStore(cache: InMemoryNormalizedCache())

    return ApolloClient(networkTransport: networkTransport, store: store)
  }()
}

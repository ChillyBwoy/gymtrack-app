//
//  EnvironmentValues+graphQLClient.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 18.02.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import Apollo
import SwiftUI

extension EnvironmentValues {
  var graphQLClient: ApolloClient {
    get { self[ApolloClient.self] }
    set { self[ApolloClient.self] = newValue }
  }
}

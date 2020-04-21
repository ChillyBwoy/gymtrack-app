//
//  ExerciseListModel.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 21.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI
import Apollo

class ExerciseListModel: ObservableObject {
  @Environment(\.graphQLClient) var graphQLClient: ApolloClient
  @Published var items: [ExerciseViewModel] = []
  
  func fetch() {
    graphQLClient.fetch(query: ExerciseListQuery()) { result in
      switch result {

      case .success(let graphQLResult):
        self.items = graphQLResult.data?.exercises?.edges.compactMap { edge in
          if let fragment = edge?.node?.fragments.exerciseListItemFragment {
            return ExerciseListItemGraphQLMapper(apiEntity: fragment).entity()
          }
          return nil
        } ?? []

      case .failure(let error):
        print("Unable to load list of exercises: \(error)")
      }
    }
  }
}

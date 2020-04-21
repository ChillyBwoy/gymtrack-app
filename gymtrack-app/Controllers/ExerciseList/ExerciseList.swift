//
//  ExerciseListContainer.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 18.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI
import Apollo

struct ExerciseList: View {
  @Environment(\.graphQLClient) var graphQLClient: ApolloClient
  @State private var items: [ExerciseViewModel] = []

  private func fetch() {
    graphQLClient.fetch(query: ExerciseListQuery()) { result in
      switch result {

      case .success(let graphQLResult):
        self.items = graphQLResult.data?.exercises?.edges.compactMap { edge in
          if let fragment = edge?.node?.fragments.exerciseDetailFragment {
            return ExerciseDetailGraphQLMapper(apiEntity: fragment).entity()
          }
          return nil
        } ?? []

      case .failure(let error):
        print("Unable to load list of exercises: \(error)")
      }
    }
  }

  var body: some View {
    VStack {
      ExerciseListView(items: items)
    }.onAppear(perform: fetch)
  }
}

struct ExerciseListContainer_Previews: PreviewProvider {
  static var previews: some View {
    ExerciseList()
  }
}

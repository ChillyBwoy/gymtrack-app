//
//  WorkoutDetailModel.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 21.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI
import Apollo

class WorkoutDetailModel: ObservableObject {
  @Environment(\.graphQLClient) private var graphQLClient: ApolloClient
  @Published var workout: WorkoutViewModel? = nil

  func fetch(id: String) {
    graphQLClient.fetch(query: WorkoutDetailQuery(id: id)) { result in
      switch result {
      case .success(let graphQLResult):
        if let fragment = graphQLResult.data?.workout?.fragments.workoutDetailFragment {
          self.workout = WorkoutDetailGraphQLMapper(apiEntity: fragment).entity()
        }

      case .failure(let error):
        print("Unable to load workout: \(error)")
      }
    }
  }
}

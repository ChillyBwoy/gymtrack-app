//
//  ExerciseDetailModel.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 21.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI
import Apollo

class ExerciseDetailModel: ObservableObject {
  @Environment(\.graphQLClient) private var graphQLClient: ApolloClient
  @Published var exercise: ExerciseViewModel? = nil
  
  func fetch(id: String) {
    graphQLClient.fetch(query: ExerciseDetailQuery(id: id)) { result in
      switch result {
      case .success(let graphQLResult):
        if let fragment = graphQLResult.data?.exercise?.fragments.exerciseDetailFragment {
          self.exercise = ExerciseDetailGraphQLMapper(apiEntity: fragment).entity()
        }

      case .failure(let error):
        print("Unable to load workout: \(error)")
      }
    }
  }
}

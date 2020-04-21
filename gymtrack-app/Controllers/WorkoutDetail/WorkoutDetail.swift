//
//  WorkoutDetailContainer.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 18.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import Apollo
import SwiftUI

struct WorkoutDetail: View {
  @Environment(\.graphQLClient) private var graphQLClient: ApolloClient
  var id: String
  @State private var entity: WorkoutViewModel? = nil

  private func fetch() {
    graphQLClient.fetch(query: WorkoutDetailQuery(id: id)) { result in
      switch result {

      case .success(let graphQLResult):
        if let fragment = graphQLResult.data?.workout?.fragments.workoutDetailFragment {
          self.entity = WorkoutDetailGraphQLMapper(apiEntity: fragment).entity()
        }

      case .failure(let error):
        print("Unable to load list of workouts: \(error)")
      }
    }
  }

  var body: some View {
    VStack(alignment: .center) {
      if entity != nil {
        WorkoutDetailView(workout: entity!)
      } else {
        Text("Loading...")
      }
    }.onAppear(perform: fetch)
  }
}

struct WorkoutDetail_Previews: PreviewProvider {
  static var previews: some View {
    WorkoutDetail(id: "V29ya291dFR5cGU6MTQ4")
  }
}

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
  var id: String
  @ObservedObject private var model = WorkoutDetailModel()

  private func fetch() {
    model.fetch(id: id)
  }

  var body: some View {
    VStack(alignment: .center) {
      if model.workout != nil {
        WorkoutDetailView(workout: model.workout!)
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

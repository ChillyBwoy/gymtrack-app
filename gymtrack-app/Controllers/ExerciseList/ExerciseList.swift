//
//  ExerciseListContainer.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 18.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

struct ExerciseList<Model>: View where Model: ExerciseListModel {
  @ObservedObject var model: Model

  private func fetch() {
    model.fetch()
  }

  var body: some View {
    ExerciseListView(items: model.items)
      .onAppear(perform: fetch)
  }
}

struct ExerciseListContainer_Previews: PreviewProvider {
  static var previews: some View {
    ExerciseList(model: ExerciseListDataModel_Previews())
  }
}

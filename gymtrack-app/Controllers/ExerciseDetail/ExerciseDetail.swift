//
//  ExerciseDetailView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 16.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

struct ExerciseDetail<Model>: View where Model: ExerciseDetailModel {
  @ObservedObject var model: Model
  var id: String

  private func fetch() {
    model.fetch(id: id)
  }

  var body: some View {
    VStack(alignment: .center) {
      if model.exercise != nil {
        NavigationView {
          ExerciseDetailView(exercise: model.exercise!)
            .navigationBarTitle(Text(model.exercise!.name))
            .navigationBarItems(trailing: EditButton())
        }
      } else {
        Text("Loading...")
      }
    }.onAppear(perform: fetch)
  }
}

struct ExerciseDetail_Previews: PreviewProvider {
  static var previews: some View {
    ExerciseDetail(model: ExerciseDetailModel_Previews(), id: "")
  }
}

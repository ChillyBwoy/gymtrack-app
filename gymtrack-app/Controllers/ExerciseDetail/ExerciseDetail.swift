//
//  ExerciseDetailView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 16.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

struct ExerciseDetail: View {
  @ObservedObject private var model = ExerciseDetailModel()
  var id: String

  private func fetch() {
    model.fetch(id: id)
  }

  var body: some View {
    VStack(alignment: .center) {
      if model.exercise != nil {
        Text(model.exercise!.name)
      } else {
        Text("Loading...")
      }
    }.onAppear(perform: fetch)
  }
}

struct ExerciseDetail_Previews: PreviewProvider {
  static var previews: some View {
    ExerciseDetail(id: "RXhlcmNpc2VUeXBlOjEwNw==")
  }
}

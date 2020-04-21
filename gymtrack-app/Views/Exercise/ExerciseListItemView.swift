//
//  ExerciseListItemView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 17.02.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

struct ExerciseListItemView: View {
  var exercise: ExerciseViewModel

  var body: some View {
    HStack {
      Text(exercise.name)
        .font(.body)
        .lineLimit(nil)
    }
  }
}

struct ExerciseListItemView_Previews: PreviewProvider {
  static var previews: some View {
    ExerciseListItemView(exercise: ExerciseViewModelStub().detail())
  }
}

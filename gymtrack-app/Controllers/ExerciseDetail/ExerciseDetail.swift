//
//  ExerciseDetailView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 16.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

struct ExerciseDetail: View {
  var exercise: ExerciseDetailFragment

  var body: some View {
    Text(exercise.name)
  }
}

//struct ExerciseDetail_Previews: PreviewProvider {
//  static var previews: some View {
//    ExerciseDetail()
//  }
//}

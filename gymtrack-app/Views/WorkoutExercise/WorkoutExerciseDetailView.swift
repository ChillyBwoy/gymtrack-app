//
//  WorkoutExerciseDetailView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 21.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

struct WorkoutExerciseDetailView: View {
  var workoutExercise: WorkoutExerciseViewModel
  var isOpen: Bool

  var body: some View {
    ZStack(alignment: .topLeading) {
      RoundedRectangle(cornerRadius: 10.0, style: .continuous)
        .fill(Color(.systemBackground))
        .shadow(color: Color(.systemGray4), radius: 4, x: 0, y: 3)

      VStack(alignment: .leading) {
        HStack(alignment: .bottom, spacing: 4) {
          ForEach(workoutExercise.exercise.categories, id: \.id) { category in
            CategoryBadgeView(category: category)
          }
        }
        Text("\(workoutExercise.exercise.name)")
          .font(.subheadline)
          .foregroundColor(Color(.systemGray))
        if isOpen {
          EffortListView(
            efforts: workoutExercise.efforts,
            unit: self.workoutExercise.exercise.unit
          )
          .transition(.asymmetric(insertion: .scale, removal: .opacity))
        }
      }
      .padding(.horizontal, 10)
      .padding(.vertical, 10)
    }
    .fixedSize(horizontal: false, vertical: true)
  }
}

struct WorkoutExerciseDetailView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      WorkoutExerciseDetailView(
        workoutExercise: WorkoutExerciseViewModelStub().detail(),
        isOpen: false
      ).padding()

      WorkoutExerciseDetailView(
        workoutExercise: WorkoutExerciseViewModelStub().detail(),
        isOpen: true
      ).padding()
    }.previewLayout(.fixed(width: 400, height: 250))
  }
}

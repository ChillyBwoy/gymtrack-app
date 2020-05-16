//
//  WorkoutExerciseEffortsView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 21.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

struct WorkoutExerciseEffortsView: View {
  var exercise: Exercise
  var efforts: [Effort]
  var isOpen: Bool

  var body: some View {
    ZStack(alignment: .topLeading) {
      RoundedRectangle(cornerRadius: 10.0, style: .continuous)
        .fill(Color(.secondarySystemBackground))

      VStack(alignment: .leading) {
        HStack(alignment: .bottom, spacing: 4) {
          ForEach(Array(exercise.categories), id: \.id) { category in
            CategoryView(category: category)
          }
        }

        Text("\(exercise.name)")
          .font(.headline)
        if isOpen {
          EffortListView(
            efforts: efforts,
            unit: exercise.unit
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

struct WorkoutExerciseEffortsView_Previews: PreviewProvider {
  static var previews: some View {
    let manager = DataManagerMemory()
    let stubProvider = WorkoutStubProvider(manager: manager)
    let workout = stubProvider.one()

    manager.save()
    
    let effortsByExercises = workout.effortsByExercises()
    let (exercise, efforts) = effortsByExercises[3]
    
    return Group {
      WorkoutExerciseEffortsView(
        exercise: exercise,
        efforts: efforts,
        isOpen: false
      ).padding()

      WorkoutExerciseEffortsView(
        exercise: exercise,
        efforts: efforts,
        isOpen: true
      ).padding()
      
      WorkoutExerciseEffortsView(
        exercise: exercise,
        efforts: efforts,
        isOpen: true
      )
      .padding()
      .colorScheme(.dark)
    }.previewLayout(.fixed(width: 400, height: 250))
  }
}

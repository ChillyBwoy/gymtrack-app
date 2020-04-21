//
//  WorkoutListView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 16.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

struct WorkoutDetailView: View {
  var workout: WorkoutViewModel
  @State private var activeItems = [String]()

  private func onExerciseTap(_ id: String) {
    if activeItems.contains(id) {
      activeItems = activeItems.filter { $0 != id }
    } else {
      activeItems.append(id)
    }
  }

  var body: some View {
    VStack(alignment: .leading) {
      ScrollView(.vertical, showsIndicators: false) {
        ForEach(workout.workoutexercises, id: \.id) { workoutExercise in
          WorkoutExerciseDetailView(
            workoutExercise: workoutExercise,
            isOpen: self.activeItems.contains(workoutExercise.id)
          )
          .padding(5)
          .onTapGesture {
            withAnimation {
              self.onExerciseTap(workoutExercise.id)
            }
          }
        }
      }
    }
  }
}

struct WorkoutDetailView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      WorkoutDetailView(
        workout: WorkoutViewModelStub().detail()
      ).colorScheme(.light)
      WorkoutDetailView(
        workout: WorkoutViewModelStub().detail()
      ).colorScheme(.dark)
    }
  }
}

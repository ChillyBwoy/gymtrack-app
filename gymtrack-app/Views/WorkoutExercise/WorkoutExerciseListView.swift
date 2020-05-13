//
//  WorkoutExerciseListView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 22.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

//struct WorkoutExerciseListView: View {
//  var items: [WorkoutExerciseViewModel]
//  @State private var activeItems = [String]()
//
//  private func onExerciseTap(_ id: String) {
//    if activeItems.contains(id) {
//      activeItems = activeItems.filter { $0 != id }
//    } else {
//      activeItems.append(id)
//    }
//  }
//
//  var body: some View {
//    VStack(alignment: .leading, spacing: 5) {
//      ForEach(items, id: \.id) { workoutExercise in
//        WorkoutExerciseDetailView(
//          workoutExercise: workoutExercise,
//          isOpen: self.activeItems.contains(workoutExercise.id)
//        )
//        .padding(5)
//        .onTapGesture {
//          withAnimation {
//            self.onExerciseTap(workoutExercise.id)
//          }
//        }
//      }
//    }
//  }
//}
//
//struct WorkoutExerciseListView_Previews: PreviewProvider {
//  static var previews: some View {
//    WorkoutExerciseListView(items: WorkoutExerciseViewModelStub().list())
//  }
//}

//
//  ExerciseProgressView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 23.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

struct ExerciseProgressView: View {
  let exercise: ExerciseViewModel
  let max: Double

  init(exercise: ExerciseViewModel) {
    self.exercise = exercise
    self.max = exercise.efforts.map { $0.value }.max() ?? 0

//    let startDate = efforts.first?.createdAt
//    let lastDate = Date()
  }
  
  var body: some View {
    GeometryReader { geometry in
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .bottom, spacing: 1) {
          ForEach(self.exercise.efforts, id: \.id) { effort in
            Capsule()
              .fill(Color(UIColor.systemBlue))
              .frame(
                width: 10,
                height: CGFloat(effort.value) / CGFloat(self.max) * geometry.size.height)
          }
        }
      }
    }
  }
}

struct ExerciseProgressView_Previews: PreviewProvider {
  static var previews: some View {
    ExerciseProgressView(exercise: ExerciseViewModelStub().detail())
  }
}

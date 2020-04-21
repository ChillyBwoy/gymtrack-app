//
//  ExerciseDetailView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 21.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

struct ExerciseDetailView: View {
  var exercise: ExerciseViewModel

  var body: some View {
    VStack {
      Text("Hello")
    }
  }
}

struct ExerciseDetailView_Previews: PreviewProvider {
  static var previews: some View {
    ExerciseDetailView(exercise: ExerciseViewModelStub().detail())
  }
}

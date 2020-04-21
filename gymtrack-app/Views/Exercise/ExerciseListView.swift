//
//  ExerciseList.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 17.02.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

struct ExerciseListView: View {
  var items: [ExerciseViewModel]

  var body: some View {
    VStack(alignment: .leading) {
      List {
        ForEach(items, id: \.id) { exercise in
          ExerciseListItemView(exercise: exercise)
        }
      }
    }
  }
}

struct ExerciseListView_Previews: PreviewProvider {
  static var previews: some View {
    ExerciseListView(items: ExerciseViewModelStub().list())
  }
}

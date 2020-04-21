//
//  EffortListView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 21.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

struct EffortListView: View {
  var efforts: [EffortViewModel]
  var unit: ExerciseViewModel.Unit

  var body: some View {
    VStack {
      Spacer()
      VStack(alignment: .leading, spacing: 10) {
        ForEach(efforts, id: \.id) { effort in
          EffortListItemView(effort: effort, unit: self.unit)
        }
      }
    }
  }
}

struct EffortListView_Previews: PreviewProvider {
  static var previews: some View {
    EffortListView(
      efforts: EffortViewModelStub().list(),
      unit: ExerciseViewModelStub().detail().unit)
    .previewLayout(.fixed(width: 400, height: 200))
  }
}

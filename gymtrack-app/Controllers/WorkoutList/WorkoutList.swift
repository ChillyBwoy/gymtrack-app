//
//  WorkoutListContainer.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 18.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI
import SwiftUIDateGrid

struct WorkoutList: View {
  @State private var selectedDates: [Date] = []
  
  private let theme: DateGridTheme = {
    let inst = DateGridTheme()

    inst.today = DateGridDayStyle(
      background: Color(UIColor.systemOrange),
      foregroundColor: .white)

    inst.day = DateGridDayStyle(
      background: .clear,
      foregroundColor: .accentColor)

    return inst
  }()

  var body: some View {
    DateGridView(
      date: Date(),
      selectedDates: $selectedDates,
      theme: theme
    )
  }
}

struct WorkoutListContainer_Previews: PreviewProvider {
  static var previews: some View {
    WorkoutList()
  }
}

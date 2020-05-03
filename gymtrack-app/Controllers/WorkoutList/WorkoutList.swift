//
//  WorkoutListContainer.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 18.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

struct WorkoutList: View {
  @State private var selectedDates: [Date] = []
  @State private var date: Date = Date()

  var body: some View {
    Text("WorkoutList")
  }
}

struct WorkoutListContainer_Previews: PreviewProvider {
  static var previews: some View {
    WorkoutList()
  }
}

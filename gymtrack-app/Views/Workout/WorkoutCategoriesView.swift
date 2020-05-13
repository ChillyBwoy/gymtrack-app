//
//  WorkoutCategoriesView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 23.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

fileprivate struct WorkoutCategoriesProgressView: View {
  var workout: Workout
  var categoriesByExercies: [Category: Double]

  var body: some View {
    GeometryReader { geometry in
      HStack(alignment: .center, spacing: 0) {
        ForEach(Array(self.workout.categories()), id: \.id) { category in
          ZStack(alignment: .topLeading) {
            Rectangle()
              .fill(Color(category.color.value))
              .frame(height: 20)
          }.fixedSize(horizontal: false, vertical: true)
            .frame(width: CGFloat(self.categoriesByExercies[category]!) * geometry.size.width)
        }
      }.clipShape(RoundedRectangle(cornerRadius: 8))
    }
  }
}

fileprivate struct WorkoutCategoriesDetailView: View {
  var workout: Workout
  var categoriesByExercies: [Category: Double]

  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .center) {
        ForEach(workout.categories(), id: \.id) { category in
          CategoryView(
            category: category,
            label: Text("\((self.categoriesByExercies[category] ?? 0) * 100, specifier: "%.2f")%"))
        }
      }
    }
  }
}


struct WorkoutCategoriesView: View {
  var workout: Workout
  var categoriesByExercies: [Category: Double]

  @State private var showDetails = false
  
  init(workout: Workout) {
    self.workout = workout
    self.categoriesByExercies = workout.categoriesByExercies()
  }

  var body: some View {
    VStack {
      if showDetails {
        WorkoutCategoriesDetailView(
          workout: workout,
          categoriesByExercies: categoriesByExercies)
      } else {
        WorkoutCategoriesProgressView(
          workout: workout,
          categoriesByExercies: categoriesByExercies)
      }
    }.onTapGesture {
      self.showDetails.toggle()
    }
  }
}


struct WorkoutCategoriesView_Previews: PreviewProvider {
  static var previews: some View {
    let manager = DataManagerMemory()
    let stubProvider = WorkoutStubProvider(manager: manager)
    let workout = stubProvider.one()

    manager.save()

    return WorkoutCategoriesView(workout: workout).padding()
  }
}

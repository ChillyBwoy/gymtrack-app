//
//  WorkoutDetailGraphQLMapper.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 20.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import UIKit

fileprivate func dateFormatter(isoStr: String) -> Date {
  let dateFormatter = ISO8601DateFormatter()
  if let date = dateFormatter.date(from: isoStr) {
    return date
  }
  return Date()
}

struct WorkoutexercisesDetailGraphQLMapper: GraphQLAPIMapper {
  var apiEntity: WorkoutExerciseFragment

  func entity() -> WorkoutExerciseViewModel? {
    if let exercise = ExerciseListItemGraphQLMapper(apiEntity: apiEntity.exercise.fragments.exerciseListItemFragment).entity() {
      let efforts: [EffortViewModel] = apiEntity.efforts.edges.compactMap { edge in
        if let fragment = edge?.node?.fragments.effortDetailFragment {
          return EffortDetailGraphQLMapper(apiEntity: fragment).entity()
        }
        return nil
      }

      return WorkoutExerciseViewModel(id: apiEntity.id, exercise: exercise, efforts: efforts)
    }
    return nil
  }
}

struct WorkoutDetailGraphQLMapper: GraphQLAPIMapper {
  var apiEntity: WorkoutDetailFragment

  func entity() -> WorkoutViewModel? {
    let date = dateFormatter(isoStr: apiEntity.date)

    let workoutexercises: [WorkoutExerciseViewModel] = apiEntity.workoutexercises.edges.compactMap { edge in
      if let fragment = edge?.node?.fragments.workoutExerciseFragment {
        return WorkoutexercisesDetailGraphQLMapper(apiEntity: fragment).entity()
      }
      return nil
    }

    let categories: [CategoryViewModel] = apiEntity.categories.edges.compactMap { edge in
      if let fragment = edge?.node?.fragments.categoryDetailFragment {
        return CategoryDetailGraphQLMapper(apiEntity: fragment).entity()
      }
      return nil
    }

    return WorkoutViewModel(
      id: apiEntity.id,
      date: date,
      workoutexercises: workoutexercises,
      categories: categories
    )
  }
}

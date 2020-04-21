//
//  ExerciseDetailGraphQLMapper.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 20.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

struct ExerciseDetailGraphQLMapper: GraphQLAPIMapper {
  var apiEntity: ExerciseDetailFragment

  func entity() -> ExerciseViewModel? {
    let categories: [CategoryViewModel] = apiEntity.categories.edges.compactMap { edge in
      if let fragment = edge?.node?.fragments.categoryDetailFragment {
        return CategoryDetailGraphQLMapper(apiEntity: fragment).entity()
      }
      return nil
    }

    return ExerciseViewModel(
      id: apiEntity.id,
      name: apiEntity.name,
      unit: apiEntity.unit,
      categories: categories
    )
  }
}

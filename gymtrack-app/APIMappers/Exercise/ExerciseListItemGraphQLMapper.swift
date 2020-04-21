//
//  ExerciseListItemGraphQLMapper.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 21.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

struct ExerciseListItemGraphQLMapper: GraphQLAPIMapper {
  var apiEntity: ExerciseListItemFragment

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

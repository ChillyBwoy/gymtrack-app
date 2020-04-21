//
//  CategoryAPIMappers.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 20.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

struct CategoryDetailGraphQLMapper: GraphQLAPIMapper {
  var apiEntity: CategoryDetailFragment

  func entity() -> CategoryViewModel? {
    return CategoryViewModel(
      id: apiEntity.id,
      name: apiEntity.name,
      color: apiEntity.color
    )
  }
}

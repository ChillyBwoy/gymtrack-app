//
//  EffortAPIMappers.swift
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

struct EffortDetailGraphQLMapper: GraphQLAPIMapper {
  var apiEntity: EffortDetailFragment

  func entity() -> EffortViewModel? {
    let createdAt = dateFormatter(isoStr: apiEntity.createdAt)

    return EffortViewModel(
      id: apiEntity.id,
      createdAt: createdAt,
      value: apiEntity.value,
      repeats: apiEntity.repeats,
      failure: apiEntity.failure)
  }
}

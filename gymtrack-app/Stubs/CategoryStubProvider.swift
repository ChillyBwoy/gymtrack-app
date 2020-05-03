//
//  CategoryStubProvider.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 03.05.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import Foundation

class CategoryStubProvider: StubProvider {
  typealias Item = Category

  func one(manager: DataProvider) -> Category {
    Category.create(with: manager.context, name: "Default category", color: .blue)
  }
  
  func many(manager: DataProvider) -> [Category] {
    CategoryColor.allCases.enumerated().map { (index, categoryColor) in
      Category.create(with: manager.context, name: "Category \(index + 1)", color: categoryColor)
    }
  }
}

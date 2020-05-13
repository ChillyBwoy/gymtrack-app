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
  
  let manager: DataProvider

  required init(manager: DataProvider) {
    self.manager = manager
  }

  func one() -> Category {
    Category(context: manager.context, name: "Default category", color: .blue)
  }
  
  func many() -> [Category] {
    CategoryColor.allCases.enumerated().map { (index, categoryColor) in
      Category(context: manager.context, name: "Category \(index + 1)", color: categoryColor)
    }
  }
}

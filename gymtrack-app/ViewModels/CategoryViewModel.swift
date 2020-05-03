//
//  Category.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 20.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

class CategoryViewModel: ViewModel, ObservableObject {
  @Published var id: String
  @Published var name: String
  @Published var color: Color
  
  init(id: String, name: String, color: Color) {
    self.id = id
    self.name = name
    self.color = color
  }

  init(id: String, name: String, color: UIColor) {
    self.id = id
    self.name = name
    self.color = Color(color)
  }
}

extension CategoryViewModel: Hashable {
  static func == (lhs: CategoryViewModel, rhs: CategoryViewModel) -> Bool {
    lhs.id == rhs.id && lhs.name == rhs.name && lhs.color == rhs.color
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
    hasher.combine(name)
    hasher.combine(color)
  }
}

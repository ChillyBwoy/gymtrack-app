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

extension CategoryViewModel {
  private static let colorMap: [CategoryColor: UIColor] = [
    .none: .black,
    .blue: .systemBlue,
    .green: .systemGreen,
    .indigo: .systemIndigo,
    .orange: .systemOrange,
    .pink: .systemPink,
    .purple: .systemPurple,
    .red: .systemRed,
    .teal: .systemTeal,
    .yellow: .systemYellow,
    .gray: .systemGray,
    .gray2: .systemGray2,
    .gray3: .systemGray3,
    .gray4: .systemGray4,
    .gray5: .systemGray5,
    .gray6: .systemGray6,
  ]

  convenience init(id: String, name: String, color: CategoryColor) {
    let newColor: Color = {
      if let color = CategoryViewModel.colorMap[color] {
        return Color(color)
      }

      return Color(.black)
    }()

    self.init(id: id, name: name, color: newColor)
  }
}

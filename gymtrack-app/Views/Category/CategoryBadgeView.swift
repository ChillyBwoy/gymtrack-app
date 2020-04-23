//
//  CategoryBadgeView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 21.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

fileprivate struct CategoryBadgeTextModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.caption)
      .foregroundColor(.white)
  }
}

struct CategoryBadgeView: View {
  var category: CategoryViewModel
  var label: Text?

  var body: some View {
    ZStack(alignment: .topLeading) {
      RoundedRectangle(cornerRadius: 4.0, style: .continuous)
        .fill(category.color)
      HStack(alignment: .center, spacing: 2) {
        Text(category.name)
          .modifier(CategoryBadgeTextModifier())
        if label != nil {
          label.modifier(CategoryBadgeTextModifier())
        }
      }
      .padding(.horizontal, 4)
      .padding(.vertical, 2)
    }.fixedSize(horizontal: true, vertical: true)
  }
}

struct CategoryBadgeView_Previews: PreviewProvider {
  static var previews: some View {
    HStack {
      ForEach(CategoryViewModelStub().list(), id: \.id) { category in
        CategoryBadgeView(category: category)
      }
    }
    .previewLayout(.fixed(width: 400, height: 60))
  }
}

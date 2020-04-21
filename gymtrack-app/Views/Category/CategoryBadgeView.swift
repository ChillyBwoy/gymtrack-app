//
//  CategoryBadgeView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 21.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

struct CategoryBadgeView: View {
  var category: CategoryViewModel

  var body: some View {
    ZStack(alignment: .topLeading) {
      RoundedRectangle(cornerRadius: 4.0, style: .continuous)
        .fill(category.color)
      Text(category.name)
        .font(.caption)
        .foregroundColor(.white)
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

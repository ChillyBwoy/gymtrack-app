//
//  CategoryView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 03.05.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

struct CategoryView: View {
  @Environment(\.managedObjectContext) var managedObjectContext
  var category: Category
  var label: Text?
  
  var body: some View {
    ZStack(alignment: .topLeading) {
      RoundedRectangle(cornerRadius: 4.0, style: .continuous)
        .fill(Color(category.color.value))
      HStack(alignment: .center, spacing: 2) {
        Text(category.name)
          .font(.caption)
          .foregroundColor(.white)
        if label != nil {
          label
            .font(.caption)
            .foregroundColor(.white)
        }
      }
      .padding(.horizontal, 4)
      .padding(.vertical, 2)
    }.fixedSize(horizontal: true, vertical: true)
  }
}

struct CategoryView_Previews: PreviewProvider {
  static var previews: some View {
    let dataManager = DataManagerMemory()
    let stubProvider = CategoryStubProvider(manager: dataManager)
    let categories = stubProvider.many()
    
    return Group {
      ForEach(categories, id: \.id) { category in
        HStack {
          CategoryView(category: category)
          CategoryView(category: category, label: Text("Label"))
        }
      }
    }.environment(\.managedObjectContext, dataManager.context)
    .previewLayout(.fixed(width: 240, height: 30))
  }
}

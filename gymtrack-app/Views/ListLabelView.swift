//
//  ListLabelView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 16.05.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

struct ListLabelView<Content>: View where Content: View {
  let label: String
  let content: Content
  
  init(label: String, @ViewBuilder content: @escaping () -> Content) {
    self.label = label
    self.content = content()
  }

  var body: some View {
    HStack(alignment: .top) {
      Text(label)
        .font(.subheadline)
      Spacer()
      content
    }
  }
}

struct ListLabelView_Previews: PreviewProvider {
  static var previews: some View {
    ListLabelView(label: "Label") {
      Text("Some value")
    }
  }
}

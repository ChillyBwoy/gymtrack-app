//
//  EffortListItemView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 21.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

fileprivate struct EffortTextViewModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.caption)
      .foregroundColor(Color(.systemGray))
  }
}

struct EffortListItemView: View {
  var effort: EffortViewModel
  var unit: ExerciseViewModel.Unit
  
  private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    return formatter
  }()

  var body: some View {
    HStack(alignment: .center, spacing: 5) {
      Text("\(effort.createdAt, formatter: dateFormatter)")
        .modifier(EffortTextViewModifier())
        .frame(minWidth: 34, alignment: .leading)

      Divider()
      if unit == .check {
        Image(systemName: "checkmark.circle.fill")
      } else if unit == .weight {
        Text("\(effort.value, specifier: "%.1f") Kg / \(effort.repeats)").modifier(EffortTextViewModifier())
      } else if unit == .step {
        Text("\(effort.repeats)").modifier(EffortTextViewModifier())
      } else if unit == .distance {
        Text("\(effort.value, specifier: "%.1f") km").modifier(EffortTextViewModifier())
      }
    }
  }
}

struct EffortListItemView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ForEach(ExerciseViewModel.Unit.allCases, id: \.self) { unit in
        EffortListItemView(
          effort: EffortViewModelStub().detail(),
          unit: unit)
        .previewLayout(.fixed(width: 300, height: 30))
      }
    }
  }
}

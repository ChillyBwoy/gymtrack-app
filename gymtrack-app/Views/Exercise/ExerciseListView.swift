//
//  ExerciseList.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 17.02.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

fileprivate enum ExerciseListViewMode: String, CaseIterable {
  case none = "All By Name"
  case groupByCategory = "Group by Category"
}

struct ExerciseListView: View {
  var items: [ExerciseViewModel]
  @State private var viewMode: ExerciseListViewMode = .none

  var body: some View {
    NavigationView {
      VStack(alignment: .leading) {
        Picker(selection: $viewMode, label: Text("show as")) {
          ForEach(ExerciseListViewMode.allCases, id: \.self) { type in
            Text("\(type.rawValue)").tag(type)
          }
        }
          .pickerStyle(SegmentedPickerStyle())
          .padding()

        List {
          Section {
            ForEach(items, id: \.id) { exercise in
              NavigationLink(
                destination: ExerciseDetailView(exercise: exercise)
              ) {
                Text(exercise.name)
                  .font(.body)
                  .lineLimit(nil)
              }
            }
          }
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
      }.navigationBarTitle(Text("Exercises"))
    }
  }
}

struct ExerciseListView_Previews: PreviewProvider {
  static var previews: some View {
    ExerciseListView(items: ExerciseViewModelStub().list())
  }
}

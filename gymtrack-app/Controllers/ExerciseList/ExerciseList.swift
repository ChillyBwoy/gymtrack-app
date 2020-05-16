//
//  ExerciseListContainer.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 18.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

fileprivate enum ExerciseListViewMode: String, CaseIterable {
  case none = "All By Name"
  case groupByCategory = "Group by Category"
}

struct ExerciseList: View {
  @Environment(\.managedObjectContext) var managedObjectContext
  @FetchRequest(fetchRequest: Exercise.fetchAll()) private var exercises: FetchedResults<Exercise>
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
            ForEach(exercises, id: \.id) { exercise in
              NavigationLink(
                destination: ExerciseDetail(id: exercise.id)
              ) {
                ExerciseListItemView(exercise: exercise)
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

struct ExerciseList_Previews: PreviewProvider {
  static var previews: some View {
    let manager = DataManagerMemory()
    let stubProvider = ExerciseStubProvider(manager: manager)
    let _ = stubProvider.list()
    
    manager.save()

    return ExerciseList()
    .environment(\.managedObjectContext, manager.context)
  }
}

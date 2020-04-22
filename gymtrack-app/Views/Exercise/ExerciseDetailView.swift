//
//  ExerciseDetailView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 21.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

struct ExerciseProgressView: View {
  let exercise: ExerciseViewModel
  let max: Double

  init(exercise: ExerciseViewModel) {
    self.exercise = exercise
    self.max = exercise.efforts.map { $0.value }.max() ?? 0

//    let startDate = efforts.first?.createdAt
//    let lastDate = Date()
  }
  
  var body: some View {
    GeometryReader { geometry in
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .bottom, spacing: 1) {
          ForEach(self.exercise.efforts, id: \.id) { effort in
            Capsule()
              .fill(Color(UIColor.systemBlue))
              .frame(
                width: 10,
                height: CGFloat(effort.value) / CGFloat(self.max) * geometry.size.height)
          }
        }
      }
    }
  }
}

struct ExerciseDetailView: View {
  @Environment(\.editMode) var mode
  var exercise: ExerciseViewModel
  @State private var selectedUnit: ExerciseViewModel.Unit
  @State private var fieldName: String
  
  init(exercise: ExerciseViewModel) {
    self.exercise = exercise
    self._selectedUnit = State(initialValue: exercise.unit)
    self._fieldName = State(initialValue: exercise.name)
  }
  
  private func delete(at indexSet: IndexSet) {
    print("delete at \(indexSet)")
  }

  var body: some View {
    VStack(alignment: .leading) {
      if exercise.efforts.count > 0 {
        ExerciseProgressView(exercise: exercise)
          .frame(height: 160)
      }
      List {
        Section(header: Text("Settings")) {
          Picker(selection: $selectedUnit, label: Text("Measure")) {
            ForEach(ExerciseViewModel.Unit.allCases, id: \.self) { type in
              Text("\(type.rawValue)").tag(type)
            }
          }
          TextField("Name of the exercise", text: $fieldName)
        }
        Section(header: Text("Categories")) {
          ForEach(exercise.categories, id: \.id) { category in
            CategoryBadgeView(category: category)
          }.onDelete(perform: delete)
        }
      }
      .listStyle(GroupedListStyle())
      .environment(\.horizontalSizeClass, .regular)
    }
    .navigationBarTitle(Text(exercise.name))
    .navigationBarItems(trailing: EditButton())
  }
}

struct ExerciseDetailView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      ExerciseDetailView(
        exercise: ExerciseViewModelStub().detail())
    }.colorScheme(.light)
  }
}

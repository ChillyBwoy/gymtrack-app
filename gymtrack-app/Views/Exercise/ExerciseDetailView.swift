//
//  ExerciseDetailView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 21.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI


struct ExerciseDetailView: View {
  @Environment(\.editMode) var mode
  var exercise: Exercise
  @State private var selectedUnit: ExerciseUnit
  @State private var fieldName: String
  
  init(exercise: Exercise) {
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
        ExerciseProgressView(exercise: exercise, width: 12)
          .frame(height: 100)
      }
      List {
        Section(header: Text("Settings")) {
          Picker(selection: $selectedUnit, label: Text("Measure")) {
            ForEach(ExerciseUnit.allCases, id: \.self) { type in
              Text("\(type.rawValue)").tag(type)
            }
          }
          TextField("Name of the exercise", text: $fieldName)
        }
        Section(header: Text("Categories")) {
          ForEach(Array(exercise.categories), id: \.id) { category in
            CategoryView(category: category)
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
    let manager = DataManagerMemory()
    let stubProvider = ExerciseStubProvider(manager: manager)
    let exercise = stubProvider.one()
    
    manager.save()
    
    return NavigationView {
      ExerciseDetailView(exercise: exercise)
    }.colorScheme(.light)
  }
}

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
  private let exercise: Exercise
  private let stat: ExerciseStat
  @State private var selectedUnit: ExerciseUnit
  @State private var fieldName: String
  
  init(exercise: Exercise) {
    self.exercise = exercise
    self.stat = exercise.stat()
    self._selectedUnit = State(initialValue: exercise.unit)
    self._fieldName = State(initialValue: exercise.name)
  }

  private func delete(at indexSet: IndexSet) {
    print("delete at \(indexSet)")
  }

  var body: some View {
    List {
      ExerciseStatView(exercise: exercise)

//      Section(header: Text("Statistics")) {
//        ListLabelView(label: "Best") {
//          Text("\(self.stat.best.0, specifier: "%.2f")")
//            .font(.headline)
//        }
//        ListLabelView(label: "Average") {
//          Text("\(self.stat.average.0, specifier: "%.2f")")
//            .font(.headline)
//        }
//      }

      Section(header: Text("Settings")) {
        Picker(selection: $selectedUnit, label: Text("Measure").font(.subheadline)) {
          ForEach(ExerciseUnit.allCases, id: \.self) { type in
            Text("\(type.rawValue)").tag(type).font(.subheadline)
          }
        }

        TextField("Name of the exercise", text: self.$fieldName)
        .font(.subheadline)
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
}

struct ExerciseDetailView_Previews: PreviewProvider {
  static var previews: some View {
    let manager = DataManagerMemory()
    let stubProvider = ExerciseStubProvider(manager: manager)
    let exercise = stubProvider.one()
    
    manager.save()
    
    return NavigationView {
      ExerciseDetailView(exercise: exercise)
//        .navigationBarTitle(Text(exercise.name))
//        .navigationBarItems(trailing: EditButton())
    }
    .colorScheme(.light)
  }
}

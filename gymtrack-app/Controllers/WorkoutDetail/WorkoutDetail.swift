//
//  WorkoutDetailContainer.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 18.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

fileprivate enum WorkoutDetailGroupBy: String, CaseIterable {
  case byExercise = "Exercise"
  case byTime = "Time"
  case byCategory = "Category"
}

struct WorkoutDetail: View {
  @Environment(\.managedObjectContext) var managedObjectContext
  let id: UUID
  private let fetchRequest: FetchRequest<Workout>
  private var workout: Workout? { fetchRequest.wrappedValue[0] }
  @State private var groupBy: WorkoutDetailGroupBy = .byExercise
  
  init(id: UUID) {
    self.id = id
    self.fetchRequest = FetchRequest<Workout>(
      entity: Workout.entity(),
      sortDescriptors: [],
      predicate: NSPredicate(format: "id == %@", id as CVarArg),
      animation: .easeIn)
  }

  private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
  }()

  var body: some View {
    NavigationView {
      if workout != nil {
        ScrollView(.vertical, showsIndicators: false) {
          VStack(alignment: .leading, spacing: 20) {
            Picker(selection: $groupBy, label: Text("Group efforts by")) {
              ForEach(WorkoutDetailGroupBy.allCases, id: \.self) { type in
                Text("\(type.rawValue)").tag(type)
              }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 5)

            WorkoutCategoriesView(workout: workout!)
              .padding(.horizontal, 8)
            WorkoutDetailView(workout: workout!)
          }
        }
        .padding(.horizontal, 10)
        .navigationBarTitle(Text("\(workout!.date, formatter: self.dateFormatter)"))
        .navigationBarItems(trailing: Button(action: {
          print("Add")
        }) {
          Image(systemName: "plus")
        })
      } else {
        Text("Workout not found")
      }
    }
  }
}


struct WorkoutDetail_Previews: PreviewProvider {
  static var previews: some View {
    let manager = DataManagerMemory()
    let stubProvider = WorkoutStubProvider(manager: manager)
    let workout = stubProvider.one()

    manager.save()

    return Group {
      WorkoutDetail(id: workout.id)
        .colorScheme(.light)
      WorkoutDetail(id: workout.id)
        .colorScheme(.dark)
    }.environment(\.managedObjectContext, manager.context)
  }
}

//
//  ExerciseDetailView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 16.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

struct ExerciseDetail: View {
  @Environment(\.managedObjectContext) var managedObjectContext
  let id: UUID
  private let fetchRequest: FetchRequest<Exercise>
  private var exercise: Exercise { fetchRequest.wrappedValue[0] }
  
  init(id: UUID) {
    self.id = id
    self.fetchRequest = FetchRequest<Exercise>(
      entity: Exercise.entity(),
      sortDescriptors: [],
      predicate: NSPredicate(format: "id == %@", id as CVarArg),
      animation: .easeIn)
  }

  var body: some View {
    VStack(alignment: .leading) {
      if exercise.efforts.count > 0 {
        EffortsProgressView(efforts: Array(exercise.efforts), width: 12)
          .frame(height: 100)
      }
      ExerciseDetailView(exercise: exercise)
        .navigationBarTitle(Text(exercise.name))
        .navigationBarItems(trailing: EditButton())
    }
  }
}

struct ExerciseDetail_Previews: PreviewProvider {
  static var previews: some View {
    let manager = DataManagerMemory()
    let stubProvider = ExerciseStubProvider(manager: manager)
    let exercise = stubProvider.one()
    manager.save()

    return NavigationView {
      ExerciseDetail(id: exercise.id)
    }
    .environment(\.managedObjectContext, manager.context)
  }
}

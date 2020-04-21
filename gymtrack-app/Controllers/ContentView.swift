//
//  ContentView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 16.02.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI
import SwiftUIDateGrid

struct ContentView: View {
  @State private var showAddEffortForm = false

  var body: some View {
    GeometryReader { geometry in
      ZStack(alignment: .bottomLeading) {
        TabView {
          WorkoutDetail(
            model: WorkoutDetailGraphQLModel(),
            id: "V29ya291dFR5cGU6MTQ4"
          ).tabItem {
            Image(systemName: "tray.2.fill")
            Text("Today")
          }.tag(1)

          WorkoutList().tabItem {
            Image(systemName: "calendar")
            Text("Workouts")
          }.tag(2)

          ExerciseList(model: ExerciseListGraphQLModel()).tabItem {
            Image(systemName: "list.bullet")
            Text("Exercises")
          }.tag(3)
        }

//        Button(action: {
//          self.showAddEffortForm = true
//        }) {
//          ZStack {
//            Circle()
//              .foregroundColor(.white)
//            Image(systemName: "plus.circle.fill")
//              .font(.largeTitle)
//          }
//        }
//        .sheet(isPresented: self.$showAddEffortForm) {
//          EffortFormView()
//        }
//        .frame(width: 72, height: 72)
//        .offset(x: geometry.size.width / 2 - 36, y: 0)
      }
    }

  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

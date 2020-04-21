//
//  AttemptFormView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 15.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import Apollo
import SwiftUI

struct EffortFormView: View {
  @ObservedObject var data = EffortForm()
  @State private var selectedExercise = ""

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Choose an Exercise")) {
          Picker(selection: $selectedExercise, label: Text("Exercise")) {
            ForEach(data.exercises, id: \.id) {
              Text($0.name).tag($0.id)
            }
          }
        }
      }
    }
    .navigationBarTitle(Text("Choose an Exercise"))
    .onAppear {
      self.data.fetch()
    }
  }
}

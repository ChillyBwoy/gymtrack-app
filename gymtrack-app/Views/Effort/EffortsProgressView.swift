//
//  ExerciseProgressView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 23.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

struct EffortsProgressView: View {
  let efforts: [Effort]
  let max: Double
  let width: Double

  init(efforts: [Effort], width: Double = 10.0) {
    self.efforts = efforts
    self.width = width
    self.max = efforts.map { $0.value }.max() ?? 0

//    let startDate = efforts.first?.createdAt
//    let lastDate = Date()
  }

  var body: some View {
    GeometryReader { geometry in
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .bottom, spacing: 1) {

          ForEach(Array(self.efforts), id: \.id) { effort in
            Capsule()
              .fill(effort.failure ? Color(UIColor.systemRed) : Color(UIColor.systemBlue))
              .frame(
                width: CGFloat(self.width),
                height: CGFloat(effort.value) / CGFloat(self.max) * geometry.size.height)
          }
        }
      }
    }
  }
}

struct ExerciseProgressView_Previews: PreviewProvider {
  static var previews: some View {
    let manager = DataManagerMemory()
    let stubProvider = ExerciseStubProvider(manager: manager)
    let exercise = stubProvider.one()
    
    manager.save()

    return VStack {
      EffortsProgressView(efforts: Array(exercise.efforts), width: 12)
        .frame(height: 200)
    }
  }
}

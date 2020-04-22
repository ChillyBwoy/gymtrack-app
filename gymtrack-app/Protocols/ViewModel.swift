//
//  ViewModel.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 20.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

protocol ViewModel: ObservableObject {
  var id: String { get }
}

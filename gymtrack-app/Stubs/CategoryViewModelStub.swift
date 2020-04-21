//
//  CategoryViewModelStub.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 20.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

struct CategoryViewModelStub: ViewModelStub {
  func detail() -> CategoryViewModel {
    CategoryViewModel(id: "1", name: "First", color: CategoryColor.blue)
  }
  
  func list() -> [CategoryViewModel] {
    return [
      CategoryViewModel(id: "1", name: "One", color: Color(UIColor.systemBlue)),
      CategoryViewModel(id: "2", name: "Two", color: Color(UIColor.systemGreen)),
      CategoryViewModel(id: "3", name: "Three", color: Color(UIColor.systemIndigo)),
      CategoryViewModel(id: "4", name: "Four", color: Color(UIColor.systemOrange)),
      CategoryViewModel(id: "5", name: "Five", color: Color(UIColor.systemPink)),
      CategoryViewModel(id: "6", name: "Six", color: Color(UIColor.systemPurple)),
      CategoryViewModel(id: "7", name: "Seven", color: Color(UIColor.systemRed)),
    ]
  }
}

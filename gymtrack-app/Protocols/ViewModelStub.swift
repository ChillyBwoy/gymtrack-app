//
//  ViewModelMock.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 20.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import UIKit

protocol ViewModelStub {
  associatedtype Entity
  
  func detail() -> Entity

  func list() -> [Entity]
}

extension ViewModelStub {
  func list() -> [Entity] {
    return []
  }
  
  func shuffle() -> [Entity] {
    var arr = list()
    arr.shuffle()
    return arr
  }
}

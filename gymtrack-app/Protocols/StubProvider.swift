//
//  StubProvider.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 03.05.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

protocol StubProvider {
  associatedtype Item

  var manager: DataProvider { get }

  init(manager: DataProvider)

  func one() -> Item
  func many() -> [Item]
}

extension StubProvider {
  func many() -> [Item] {
    []
  }
}

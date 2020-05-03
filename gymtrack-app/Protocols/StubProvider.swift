//
//  StubProvider.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 03.05.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

protocol StubProvider {
  associatedtype Item

  func one(manager: DataProvider) -> Item
  func many(manager: DataProvider) -> [Item]
}

extension StubProvider {
  func many(manager _: DataProvider) -> [Item] {
    []
  }
}

//
//  GraphQLAPIMapper.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 20.04.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

protocol GraphQLAPIMapper {
  associatedtype APIEntity
  associatedtype Entity: ViewModel
  
  var apiEntity: APIEntity { get }

  func entity() -> Entity?
}

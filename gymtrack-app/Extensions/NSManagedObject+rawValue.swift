//
//  NSManagedObject+rawValue.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 03.05.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import CoreData
import Foundation

extension NSManagedObject {
  func setRawValue<ValueType: RawRepresentable>(forKey key: String, value: ValueType) {
    willChangeValue(forKey: key)
    setPrimitiveValue(value.rawValue as AnyObject, forKey: key)
    didChangeValue(forKey: key)
  }

  func rawValue<ValueType: RawRepresentable>(forKey key: String) -> ValueType? {
    willAccessValue(forKey: key)

    let result = primitiveValue(forKey: key) as! ValueType.RawValue
    didAccessValue(forKey: key)

    return ValueType(rawValue: result)
  }
}

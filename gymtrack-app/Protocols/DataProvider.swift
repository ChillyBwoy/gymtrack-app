//
//  DataProvider.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 03.05.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import Foundation
import CoreData

protocol DataProvider: class {
  var containerName: String { get }
  var persistentContainer: NSPersistentContainer { get }
  var context: NSManagedObjectContext { get }
  func save() -> Void
  func saveAfter(fn: @escaping (_ manager: Self) -> Void) -> Void
}

extension DataProvider {
  func save() {
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        // Replace this implementation with code to handle the error appropriately.
        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }
  
  func saveAfter(fn: @escaping (_ manager: Self) -> Void) -> Void {
    fn(self)
    save()
  }
}

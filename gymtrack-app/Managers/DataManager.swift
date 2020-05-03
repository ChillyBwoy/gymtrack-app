//
//  DataManager.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 03.05.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import CoreData
import Foundation

protocol DataManager {
  var containerName: String { get }
  var persistentContainer: NSPersistentContainer { get }
  var context: NSManagedObjectContext { get }
  func save() -> Void
}

extension DataManager {
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
}

class DataManagerDB: DataManager {
  private(set) var containerName: String
  private(set) var persistentContainer: NSPersistentContainer
  private(set) var context: NSManagedObjectContext

  init() {
    containerName = "gymtrack_app"
    let container = NSPersistentCloudKitContainer(name: containerName)
    container.loadPersistentStores(completionHandler: { _, error in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    persistentContainer = container
    context = persistentContainer.viewContext
  }
}

class DataManagerMemory: DataManager {
  private(set) var containerName: String
  private(set) var persistentContainer: NSPersistentContainer
  private(set) var context: NSManagedObjectContext
  
  init() {
    containerName = "gymtrack_app"

    let description = NSPersistentStoreDescription()
    description.type = NSInMemoryStoreType
    description.shouldAddStoreAsynchronously = false

    let container = NSPersistentContainer(
      name: containerName,
      managedObjectModel: NSManagedObjectModel.mergedModel(from: [Bundle.main])!
    )
    container.persistentStoreDescriptions = [description]
    container.loadPersistentStores { storeDescription, error in
      precondition(storeDescription.type == NSInMemoryStoreType)
      if let error = error as NSError? {
        fatalError("In memory coordinator creation failed \(error), \(error.userInfo)")
      }
    }
    
    persistentContainer = container
    context = persistentContainer.viewContext
  }
}

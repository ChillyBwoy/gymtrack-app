//
//  DataManagerMemory.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 03.05.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import CoreData
import Foundation

final class DataManagerMemory: DataProvider {
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

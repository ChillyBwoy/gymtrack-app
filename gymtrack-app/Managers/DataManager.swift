//
//  DataManager.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 03.05.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import CoreData
import Foundation

final class DataManager: DataProvider {
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

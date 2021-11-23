//
//  Persistence.swift
//  PGR5601EXAMSWIFTUI
//
//  Created by Andreas on 23/11/2021.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = User(context: viewContext)
            newItem.firstName = "Test"
            newItem.lastName = "Testesen"
            newItem.postcode = "0253"
            newItem.city = "Oslo"
            newItem.email = "test@test.no"
            newItem.state = "Oslo"
            newItem.country = "Norway"
            newItem.latitude = "0.0"
            newItem.longitude = "0.0"
            newItem.street = "Osloveien 1"
            newItem.thumbnail = URL.init(string: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngwing.com%2Fen%2Ffree-png-nzyal&psig=AOvVaw3PIj7-JIIGnH0xCSkTjc8b&ust=1637754459751000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJDUrvi0rvQCFQAAAAAdAAAAABAD")
            newItem.largeThumbnail = URL.init(string: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngwing.com%2Fen%2Ffree-png-nzyal&psig=AOvVaw3PIj7-JIIGnH0xCSkTjc8b&ust=1637754459751000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJDUrvi0rvQCFQAAAAAdAAAAABAD")
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "PGR5601EXAMSWIFTUI")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                Typical reasons for an error here include:
                * The parent directory does not exist, cannot be created, or disallows writing.
                * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                * The device is out of space.
                * The store could not be migrated to the current model version.
                Check the error message to determine what the actual problem was.
                */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    func save() {
         let context = container.viewContext

         if context.hasChanges {
             do {
                 try context.save()
             } catch {
                 debugPrint(error)
             }
         }
     }
     
     func count() -> Int {
         let context = container.viewContext
         let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
         do {
             return try context.count(for: fetchRequest)
         } catch {
             debugPrint(error)
         }
         return 0
     }
}

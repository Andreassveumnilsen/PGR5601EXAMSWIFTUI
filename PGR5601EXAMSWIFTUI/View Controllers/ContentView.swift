//
//  ContentView.swift
//  PGR5601EXAMSWIFTUI
//
//  Created by Andreas on 11/11/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.scenePhase) var scenePhase
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \User.firstName, ascending: true)],
        animation: .default)
    private var users: FetchedResults<User>

    var body: some View {
            NavigationView {
                List {
                    ForEach(users) { user in
                        NavigationLink {
                            UserDetails(user: user)
                           
                        } label: {
                            UserListElement(
                                firstname: user.firstName!,
                                lastname: user.lastName!,
                                thumbnail: user.thumbnail!
                            )
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                }
                Text("Select an item")
            }.onAppear {
                UserController().loadData()
            }
        }

        private func deleteItems(offsets: IndexSet) {
            withAnimation {
                offsets.map { users[$0] }.forEach(viewContext.delete)

                do {
                    try viewContext.save()
                } catch {
                    // Replace this implementation with code to handle the error appropriately.
                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
            }
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }

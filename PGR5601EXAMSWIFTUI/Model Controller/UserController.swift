//
//  APIController.swift
//  PGR5601EXAMSWIFTUI
//
//  Created by Andreas on 11/11/2021.
//
import Foundation

class UserController {
        
        let persistenceController = PersistenceController.shared
        
        func loadData() {
            let userCount = persistenceController.count()
            let usersToFetch = 100 - userCount
            debugPrint("Users in db: \(userCount)")
            
            if (usersToFetch <= 0) {
                debugPrint("Will not fetch new users")
                return
            }
            
            guard let url = URL(string: "https://randomuser.me/api/?results=\(usersToFetch)&seed=ios&nat=no") else {
                print("Invalid url...")
                return
            }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                let usersDtoResult = try! JSONDecoder().decode(UsersDto.self, from: data!)
                let userDtos = usersDtoResult.results
                
                self.persistUsers(userDtos: userDtos)
            }.resume()
        }
        
        func persistUsers(userDtos: [UserDto]) {
            for userDto in userDtos {
                persistUser(userDto: userDto)
            }
            persistenceController.save()
            debugPrint("Saved users")
        }
        
        func persistUser(userDto: UserDto) {
            let newItem = User(context: persistenceController.container.viewContext)
            newItem.firstName = userDto.name.first
            newItem.lastName = userDto.name.last
            newItem.age = Int64(userDto.dob.age)
            newItem.street = "\(userDto.location.street.name) \(userDto.location.street.number)"
            newItem.country = userDto.location.country
            newItem.state = userDto.location.state
            newItem.city = userDto.location.city
            newItem.longitude = userDto.location.coordinates.longitude
            newItem.latitude = userDto.location.coordinates.latitude
            newItem.postcode = userDto.location.postcode
            newItem.largeThumbnail = URL.init(string: userDto.picture.large)
            newItem.thumbnail = URL.init(string: userDto.picture.thumbnail)
            newItem.email = userDto.email
        }
    }


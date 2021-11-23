//
//  UserDto.swift
//  PGR5601EXAMSWIFTUI
//
//  Created by Andreas on 02/11/2021.
//

import Foundation
struct UsersDto: Codable {
        let results: [UserDto]
    }

    struct UserDto: Codable {
        var gender: String
        var name: Name
        var location: Location
        var email: String
        var dob: Dob
        var phone: String
        var cell: String
        var picture: Picture
        var nat: String
    }

    struct Name: Codable {
        var title: String
        var first: String
        var last: String
    }

    struct Location: Codable {
        var street: Street
        var city: String
        var state: String
        var country: String
        var postcode: String
        var coordinates: Coordinates

    }

    struct Street: Codable {
        var number: Int
        var name: String
    }

    struct Coordinates: Codable {
        var latitude: String
        var longitude: String
    }

    struct Dob: Codable {
        var date: String
        var age: Int
    }

    

    struct Picture: Codable {
        var large: String
        var medium: String
        var thumbnail: String
    }

//
//  User.swift
//  PGR5601EXAMSWIFTUI
//
//  Created by Andreas on 23/11/2021.
//

import Foundation

struct UserDto: Codable {
        let results: [UserDto]
    }

    struct UserDto: Codable {
        var gender: String
        var name: Name
        var location: Location
        var email: String
        var login: Login
        var dob: Dob
        var registered: Registered
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
        var timezone: Timezone
    }

    struct Street: Codable {
        var number: Int
        var name: String
    }

    struct Coordinates: Codable {
        var latitude: String
        var longitude: String
    }

    struct Timezone: Codable {
        var offset: String
        var description: String
    }

    struct Login: Codable {
        let uuid: UUID
        var username: String
        var password: String
        var salt: String
        var md5: String
        var sha1: String
        var sha256: String
    }

    struct Dob: Codable {
        var date: String
        var age: Int
    }

    struct Registered: Codable {
        var date: String
        var age: Int
    }

    struct Picture: Codable {
        var large: String
        var medium: String
        var thumbnail: String
    }

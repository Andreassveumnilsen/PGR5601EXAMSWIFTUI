//
//  MapView.swift
//  PGR5601EXAMSWIFTUI
//
//  Created by Andreas on 11/11/2021.
//

import SwiftUI
import MapKit

struct UserCoordinates: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \User.firstName, ascending: true)],
        animation: .default)
    private var users: FetchedResults<User>
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    
    let annotations = [
        UserCoordinates(name: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngwing.com%2Fen%2Ffree-png-nzyal&psig=AOvVaw3pwQYdJTx90LVZiInCy0va&ust=1637771922396000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCPj3jv_1rvQCFQAAAAAdAAAAABAD", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275)),
        UserCoordinates(name: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508)),
        UserCoordinates(name: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5)),
        UserCoordinates(name: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667))
    ]
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: annotations) { location in
            MapAnnotation(coordinate: location.coordinate) {
                AsyncImage(url: URL(string: "https://www.hackingwithswift.com/img/paul-2.png")) { image in
                    image.resizable()
                } placeholder: {
                    Color.red
                }
                .scaledToFit()
                .frame(width: 100, height: 25)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 25/10))
                .shadow(radius: 10)
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

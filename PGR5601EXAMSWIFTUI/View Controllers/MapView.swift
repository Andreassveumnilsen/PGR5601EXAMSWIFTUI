//
//  MapView.swift
//  PGR5601EXAMSWIFTUI
//
//  Created by Andreas on 11/11/2021.
//

import SwiftUI
import MapKit

struct UserCoordinates: Identifiable {
    var id = UUID()
    let name: URL
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    let persistenceController = PersistenceController.shared
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \User.firstName, ascending: true)],
        animation: .default)
    private var users: FetchedResults<User>
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    
    
    
    
    var body: some View{
        Map(coordinateRegion: $region, annotationItems: users.map { (user) -> UserCoordinates in
            return UserCoordinates(
                id: user.id!,
                name: user.thumbnail!,
                coordinate: CLLocationCoordinate2D(latitude: Double(user.latitude!)!, longitude: Double(user.longitude!)!))
        }) { location in
            MapAnnotation(coordinate: location.coordinate) {
                NavigationLink {
                    //UserDetails()
                } label: {
                    AsyncImage(url: location.name) { image in
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
    }

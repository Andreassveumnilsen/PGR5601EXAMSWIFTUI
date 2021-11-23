//
//  UserListElement.swift
//  PGR5601EXAMSWIFTUI
//
//  Created by Andreas on 11/11/2021.
//
import SwiftUI

struct UserListElement: View {
    let firstname: String
    let lastname: String
    let thumbnail: URL
    
    var body: some View {
        HStack(alignment: .center, content: {
            Text("\(firstname) \(lastname)")
            Spacer()
            AsyncImage(url: thumbnail)
        })
    }
}


struct UserListElement_Previews: PreviewProvider {
    static var previews: some View {
        UserListElement(firstname: "Test", lastname: "Testesen", thumbnail: URL.init(string: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngwing.com%2Fen%2Ffree-png-nzyal&psig=AOvVaw3pwQYdJTx90LVZiInCy0va&ust=1637771922396000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCPj3jv_1rvQCFQAAAAAdAAAAABAD")!)
    }
}

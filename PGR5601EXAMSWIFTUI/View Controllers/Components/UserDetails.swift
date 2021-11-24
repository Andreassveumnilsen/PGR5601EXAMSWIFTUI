//
//  UserDetails.swift
//  PGR5601EXAMSWIFTUI
//
//  Created by Andreas on 14/11/2021.
//

import SwiftUI

struct UserDetails: View {
    let user: User
    var body: some View{
        VStack(alignment: .center) {
            AsyncImage(url: user.largeThumbnail)
            Group {
                Divider()
                HStack(alignment: .center) {
                    Text("Firstname").font(.subheadline)
                    Spacer()
                    Text(user.firstName!)
                }
                Divider()
            }.padding(.horizontal, 12)
            Group {
                HStack(alignment: .center) {
                    Text("Lastname").font(.subheadline)
                    Spacer()
                    Text(user.lastName!)
                }
                Divider()
                }.padding(.horizontal, 12)
                Group {
                    HStack(alignment: .center) {
                        Text("Age").font(.subheadline)
                        Spacer()
                        Text("\(user.age)")
                    }
                Divider()
                }.padding(.horizontal, 12)
                Group {
                    HStack(alignment: .center) {
                    Text("Email").font(.subheadline)
                    Spacer()
                    Text(user.email!)
                }
                Divider()
            }.padding(.horizontal, 12)
            Group {
                HStack(alignment: .center) {
                    Text("City").font(.subheadline)
                    Spacer()
                    Text(user.city!)
                }
                Divider()
                HStack(alignment: .center) {
                    Text("County").font(.subheadline)
                    Spacer()
                    Text(user.state!)
                }
                Divider()
                HStack(alignment: .center) {
                    Text("Postcode").font(.subheadline)
                    Spacer()
                    Text(user.postcode!)
                }
                Divider()
            }.padding(.horizontal, 12)
            Spacer()
        }
    }
}


//
//  UserAccountView.swift
//  dnd-planner
//
//  Created by Kierstyn Just on 5/3/22.
//

import SwiftUI

struct UserAccountView: View {
    var body: some View {
        VStack {
        NavigationView {
            List {
                NavigationLink(destination: UserProfileView()) {
                    Label("View Profile", systemImage: "person.text.rectangle.fill")
                }
                NavigationLink(destination: FriendsListView()) {
                    Label("Friends List", systemImage: "person.2.fill")
                }
                Text("Sign in/sign out")
                Text("Sign up")
            }
        }
        }
        .navigationBarTitle("User Account", displayMode: .inline)
        .navigationBarHidden(false)
    }
}

// user profile
struct UserProfileView: View {
    var body: some View {
        Text("User Profile")
    }
}

// friends list
struct FriendsListView: View {
    var body: some View {
        VStack {
            List {
                FriendListItem(username: "bigverl")
                FriendListItem(username: "thonbone")
                FriendListItem(username: "SuperSayanKaylee")
                FriendListItem(username: "JoPis")
                FriendListItem(username: "LilWeng")
                FriendListItem(username: "KingShrimpLouey")
                FriendListItem(username: "BlandenBlockliver")
                FriendListItem(username: "wulfyspice")
            }
        }
        .navigationBarTitle("Friends", displayMode: .inline)
    }
}

struct FriendListItem: View {
    var username: String = ""
    
    var body: some View {
        HStack {
            Text(username)
            Spacer()
            Button(action: {}) {
                Image(systemName: "envelope")
            }
        }
    }
}

struct UserAccountView_Previews: PreviewProvider {
    static var previews: some View {
        UserAccountView()
        FriendsListView()
    }
}

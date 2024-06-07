//
//  MainTabView.swift
//  SwiftUIAuthTutorial
//
//  Created by Lauro Pimentel on 26/06/24.
//

import Foundation

import SwiftUI
import SwiftData

struct MainTabView: View {
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some View {
        TabView{
            MyItemsView().modelContainer(sharedModelContainer)
                .tabItem { Label("My Cases", systemImage: "magnifyingglass") }
//            WishlistsView() .tabItem { Label("Wishlists", systemImage: "heart") }
            ProfileView() .tabItem { Label("Profile", systemImage: "person") }
        }
    }
}

#Preview {
    MainTabView()
}


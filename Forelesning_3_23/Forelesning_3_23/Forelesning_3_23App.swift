//
//  Forelesning_3_23App.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 04/09/2023.
//

import SwiftUI

@main
struct Forelesning_3_23App: App {
    
    @State var shoppingCart = [Product]()
    
    var body: some Scene {
        WindowGroup {
            
            TabView {
                
                ProductListView(products: Product.demoProducts, isAdmin: false, shoppingCart: $shoppingCart)
                    .tabItem {
                        Label("Produkter", systemImage: "tray.and.arrow.up.fill")
                    }
                
                ShoppingCartView()
                    .badge($shoppingCart.count)
                    .tabItem {
                        Label("Handlekurv", systemImage: "cart.fill")
                    }
                
                SettingsView()
                    .tabItem {
                        Label("Innstillinger", systemImage: "pencil")
                    }
            }
            
        }
    }
}

//
//  ContentView.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 04/09/2023.
//

import SwiftUI

enum UserLevel {
    case user
    case admin
    case employee
}

struct ProductListView: View {
    /// mac versjon?
    /// Content view?
    ///
    //    let products = ["Bukse", "T-skjorte", "Sko"]
    
    init(products: [Product], isAdmin: Bool) {
        self.products = products
        self.isAdmin = isAdmin
    }
    
    
    let isAdmin: Bool
    @State var products: [Product]
    
    @State var isPresentingAddProductView: Bool = false
    
    @State var isShowingAlert: Bool = false
    
    /// Textfield attributes
    @State var newProductName: String = ""
    @State var newProductPrice: String = ""
    @State var newProductDescription: String = ""
    
    
    
    //    @AppStorage var hasSeenOnboarding = false
    
    //    @Published
    //    @ObservedObject
    
    
    
    func addProduct() {
        print("user still tapped button")
        if let productPrice = Int(newProductPrice) {
            let product = Product(name: newProductName, description: newProductDescription, price: productPrice)
            products.append(product)
        } else {
            print("feil format _\(newProductPrice)_")
        }
        
    }
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(products) { product in
                    NavigationLink {
                        ProductDetailView(product: product)
                    } label: {
                        ListItemView(product: product)
                    }
                } // Foreach
                if isAdmin {
                    Button("Legg til produkt") {
                        let newProduct = Product.init(name: "Sokker", description: "small, gule", price: 230)
                        print(products.count) // printer 2
                        products.append(newProduct)
                        isPresentingAddProductView = true
                        
                    }// Button
                } else {
                        // not admin
                        Text("Du er en vanlig bruker")
                    }
                }.sheet(isPresented: $isPresentingAddProductView) {
                    AddProductView() { product in
                        print(product)
                    }
                }
            }
        }
    }
    
    struct ProductListView_Previews: PreviewProvider {
        static var previews: some View {
            ProductListView(products: Product.demoProducts, isAdmin: true)
        }
    }
    
    struct ListItemView: View {
        
        let product: Product
        
        var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                Text("\(product.name)")
                Text(product.description)
                    .foregroundColor(.gray)
            }.padding()
                .foregroundColor(.brown)
        }
    }

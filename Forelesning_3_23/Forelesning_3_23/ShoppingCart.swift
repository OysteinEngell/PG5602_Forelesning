//
//  ShoppingCart.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 18/09/2023.
//

import SwiftUI

struct ShoppingCart: View {
    
    var shoppingCart: Binding<[Product]>
    @State var totalSum = 0
    init(ShoppingCart: Binding<[Product]>){
        self.shoppingCart = ShoppingCart
        
    }
    
    func onAppear() {
        totalSum = 0
        for product in shoppingCart.wrappedValue {
            totalSum += product.price
        }
    }
    
    var body: some View {
        NavigationView  {
            List {
                ForEach(shoppingCart){ product in
                        HStack{
                            Text("\(product.wrappedValue.name)")
                            Spacer()
                            Text("\(product.wrappedValue.price)kr")
                        }
                    }
                Text("Totalt: \(totalSum) kr")
            }
            .navigationTitle("Handlekurv")
        }.onAppear{
            onAppear()
    }
    }
}

struct ShoppingCart_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCart(ShoppingCart: .constant([
            Product(name: "Sokker", description: "Gule", price: 500, images: [])
        ]))
    }
}

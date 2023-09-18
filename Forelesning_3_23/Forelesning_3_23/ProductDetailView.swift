//
//  ProductDetailView.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 04/09/2023.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    
    init(product: Product) {
        print(product)
        self.product = product
    }
    
    var body: some View {
        VStack {

            HStack{
                Text(product.name)
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 40)
                    
                    
                Spacer()
            }// HStack - Title
            Image("productImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
            
            Text(product.description)
                .padding(
                    EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0)
                )
            
            Spacer()
            Text("\(product.price  + Int.random(in: 10...400)) kr").strikethrough()
            Text("Nå: \(product.price) kr")
            
            Button {
                // TODO: buy product
                print("bought: \(product.name)")
            } label: {
                ZStack{
                    Circle()
                        .frame(width: 100)
                        .foregroundColor(.yellow)
                    Text("Kjøp")
                }
            }

        }.padding(20)
        
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: .init(name: "Tennissko", description: "hvite, str 45", price: 999))
    }
}

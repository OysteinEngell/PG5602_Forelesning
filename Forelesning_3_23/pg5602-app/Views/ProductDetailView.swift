//
//  ProductDetailView.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 04/09/2023.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    
    @State var scale: CGFloat = 1
    @State var rotationAngle: CGFloat = 0
    @State var imageScale: CGFloat = 200
    
    init(product: Product) {
        self.product = product
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(product.name)
                    .font(.largeTitle)
                    .bold()
                    .fontWeight(nil)
                    .padding(.top, 40)
                    .padding(.leading, 40)
                Spacer()
            } // HStack - Title
            
            Image("productImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageScale)
            
            
            Text(product.description)
                .padding(
                    EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0)
                )
            
            Spacer()
            Text("Før \(product.price + Int.random(in: 10...400)) kr ")
                .strikethrough()
                .padding(.top)
            
            Text("Nå \(product.price) kr ")
                .padding(.vertical)
            
            Button {
                // TODO: buy product
                withAnimation(Animation.easeIn(duration: 0.5)) {
                    scale = 1.3
                    rotationAngle += 360
                }
                
                withAnimation(Animation.easeIn(duration: 0.5).delay(0.6)) {
                    scale = 1
                }
                
              
                print("bought \(product.name)")
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 100)
                        .foregroundColor(.yellow)
                    Text("Kjøp")
                }
            }
//            .scaleEffect(scale)
//            .animation(.spring(), value: scale)
//            .rotationEffect(Angle(degrees: rotationAngle))
//            .animation(.easeInOut, value: rotationAngle)

        }.onAppear{
            withAnimation(Animation.easeOut(duration: 0.5).delay(0.4)){
                imageScale = 300
            }
        }
        
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: .init(name: "Tennissko", description: "hvite, str 45", price: 999, images: []))
    }
}

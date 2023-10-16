//
//  coolImageStyle.swift
//  Forelesning_3_23
//
//  Created by Øystein Engell on 16/10/2023.
//

import Foundation
import SwiftUI

struct CoolImageStyle: ViewModifier {
 
    func body(content: Content ) -> some View {
        content
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200)
            .clipped()
            .cornerRadius(25)
            .shadow(radius: 20)
    }
}

struct CoolImageStyle_Previews: PreviewProvider{
    static var previews: some View {
        Image("productImage")
            .resizable()
            .modifier(CoolImageStyle())
    }
    
    
}

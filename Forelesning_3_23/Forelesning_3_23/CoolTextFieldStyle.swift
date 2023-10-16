//
//  CoolTextFieldStyle.swift
//  Forelesning_3_23
//
//  Created by Øystein Engell on 16/10/2023.
//

import Foundation
import SwiftUI

struct CoolTextFieldStyle : ViewModifier {
    func body(content: Content) -> some View{
        
        
        content
            .textFieldStyle(.roundedBorder)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))
    }
}

struct CoolTextFieldStylePreview: View {
    @State var nameText = ""
    @State var phoneText = ""
    
    var body: some View {
        VStack{
            TextField("Navn", text: $nameText)
                .modifier(CoolTextFieldStyle())
            
            TextField("Navn", text: $phoneText)
                .modifier(CoolTextFieldStyle())
        }
    }
}

extension View {
    static var coolTextFieldStyle: any View {
        fatalError()
            
    }
}

struct CoolTextFieldStyle_Previews: PreviewProvider {
    static var previews: some View {
        CoolTextFieldStylePreview()
    }
}

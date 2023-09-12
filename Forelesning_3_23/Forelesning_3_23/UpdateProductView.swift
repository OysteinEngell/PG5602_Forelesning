//
//  UpdateProductView.swift
//  Forelesning_3_23
//
//  Created by Øystein Engell on 12/09/2023.
//

import SwiftUI

struct UpdateProductView: View {
    
    
    var minusButtonTapped: ( ()->() )
    
    var plussButtonTapped: ( () -> Void )
    
    init(
        minusButtonTapped: @escaping ( () -> () ),
        plussButtonTapped: @escaping ( () -> () )
    ){
        self.minusButtonTapped = minusButtonTapped
        self.plussButtonTapped = plussButtonTapped
    }
    
    //    func demoFunction() -> Void {}
    
    
    
    
    @State var demoText: String = ""
    var body: some View {
        HStack{
            ZStack{
                Circle()
                Text("-").foregroundColor(.white)
            }
            .onTapGesture {
                minusButtonTapped()
            }
            
            Text(demoText)
            
            ZStack{
                Circle()
                Text("+").foregroundColor(.white)
            }
            .onTapGesture {
                plussButtonTapped()
            }
        }.font(.title).padding()
        
    }
}

struct UpdateProductView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateProductView(
            minusButtonTapped: {
                print("minusbutton tapped")
                return()
                
            },
            plussButtonTapped: {
                print("plussbutton tapped")
                return()
            }
        )//UpdateProductView
    }
}

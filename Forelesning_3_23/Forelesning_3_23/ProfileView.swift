//
//  ProfileView.swift
//  Forelesning_3_23
//
//  Created by Øystein Engell on 19/09/2023.
//

import SwiftUI

enum AppStorageKeys : String {
    case username
}

struct ProfileView: View {
    
//    @AppStorage(AppStorageKeys.username.rawValue) var username: String?
    
    @State var username: String?
    
//    var isLoggedIn: Binding<Bool> {
//        Binding.init(get: {
//            username != nil
//        }, set: { _ in }
//        )
//
//
//
//    }
    
    @State var isLoggedIn : Bool = false
    
    func onAppear(){
        //sjekk om bruker er logget inn
        if let userName = UserDefaults.standard.object(forKey: AppStorageKeys.username.rawValue){
            self.username = username
            print(userName as Any)
            isLoggedIn = true
        }
        
    }
    
    func createUserTapped(){
        UserDefaults.standard.set(username, forKey: AppStorageKeys.username.rawValue)
        isLoggedIn = true
    }
    
    func deleteUserTapped(){
        UserDefaults.standard.removeObject(forKey: AppStorageKeys.username.rawValue)
        isLoggedIn = false
        username = nil
    }
    
    var body: some View {
        
        VStack{
            
            TextField("Brukernavn", text: Binding(
                get: {
                    if let username = username { return username }
                    return ""
                },
                set: {
                    value, transaction in username = value
                }
            )//Binding
            )//TextField
            .border(.black, width: 1)
            .textFieldStyle(.roundedBorder)
            .padding(50)
            
            Button("Opprett bruker"){
                createUserTapped()
            }
            
            if isLoggedIn{
                Button("Slett bruker"){
                    deleteUserTapped()
                }
            }
            
           
            
            
            
            
            
                
        }.onAppear{onAppear()}
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

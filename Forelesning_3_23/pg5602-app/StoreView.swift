//
//  StoreView.swift
//  pg6502-app
//
//  Created by Øystein Engell on 23/10/2023.
//

import SwiftUI
import CoreData

struct StoreView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: [.init(key: "name", ascending: true)]) var stores: FetchedResults<Store>
    
    var body: some View {
        VStack{
            Text("Stores")
            ForEach(stores){store in
                Text(store.name ?? "N/A")
            }
            Button("Insert Store"){
                
                let entity = NSEntityDescription.entity(forEntityName: "Store", in: moc)!
                let store = Store(entity: entity, insertInto: moc)
                
                store.name = "testbutikk 1"
                store.latitude = 52.2314235
                store.longitude = 10.1234093242
                store.openingHour = "man-fre 07:00-17:00"
                
                moc.saveAndPrintError()
            }
            Button("Delete All"){
                for store in stores {
                    moc.delete(store)
                    //undo?
                    moc.saveAndPrintError()
                }
            }
        }.onAppear{
            if moc.hasChanges {
                moc.undo()
            }
        }
    }//body
}

#Preview {
    StoreView()
}

extension NSManagedObjectContext{
    func saveAndPrintError(){
        do{
            try self.save()
        }catch let error {
            print(error)
        }
    }
}

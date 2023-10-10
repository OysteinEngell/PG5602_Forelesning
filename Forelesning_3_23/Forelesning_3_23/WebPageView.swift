//
//  WebPageView.swift
//  Forelesning_3_23
//
//  Created by Øystein Engell on 10/10/2023.
//

import SwiftUI
import SafariServices

struct WebPageView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}


struct WebpageView_Previews: PreviewProvider{
    static var previews: some View{
        WebPageView(url: URL.init(string: "https://politiet.no")!)
    }
}



//
//  APIClient.swift
//  Forelesning_3_23
//
//  Created by Øystein Engell on 09/10/2023.
//

import Foundation

struct APIClient {
    var getProducts : ( () async throws -> ([Product]) )
    
    var purchaseProducts: ( ([Product]) async throws -> () )
    
}

   

extension APIClient {
    static let live = APIClient(getProducts: {
        
        let url = URL(string:
            "https://raw.githubusercontent.com/BeiningBogen/PG5602/master/products.json")!
        
        
        let (data, response) = try await URLSession.shared.data(from: url)
        let products = try JSONDecoder().decode([Product].self, from: data)
        
        return products
    }) { products in
        let url = URL(string:
                        "https://raw.githubusercontent.com/BeiningBogen/PG5602/master/products.json")!
        var urlRequest = URLRequest.init(url: url)
        urlRequest.httpMethod = "POST"
        
        let body = try JSONEncoder().encode(products)
        urlRequest.httpBody = body
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        if let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode != 200 {
            throw APIClientError.statusCode(statusCode)
        }
    }
    
    static let demo = APIClient(getProducts: {
        let product = Product.init(name: "Tøfler", description: "Grå, kule, str 42", price: 900, images: [ProductImage]())
        let product2 = Product.init(name: "Tøfler", description: "Grå, kule, str 42", price: 900000, images: [ProductImage]())
        return [product, product2]
    }, purchaseProducts: {products in
//        throw APIClientError.stolenCard
    })
    
    static func error(_ error: APIClientError) -> APIClient {
        APIClient {
        throw error
    } purchaseProducts: { _ in
        throw error
    }
    }
}

enum APIClientError : Error {
    case failed(underlying: Error)
    case statusCode(Int)
    case notEnoughFunds
    case stolenCard
}

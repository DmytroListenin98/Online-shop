//
//  Product.swift
//  Online Shop
//
//  Created by Dmytro Listenin on 12.04.2026.
//

import Foundation
import FirebaseFirestoreCombineSwift
import FirebaseFirestore
import SwiftUI


struct Product: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var description: String
    var image: String
    var price: Double
    var isFavorite: Bool
    var quantityInCart: Int?
    
}

func addTestProduct() {
    let db = Firestore.firestore()
    let newProduct = Product(
        name: "name",
        description: "description Text",
        image: "image link",
        price: 0.0,
        isFavorite: false
    )
    
    do {
        try db.collection("Shop").addDocument(from: newProduct)
        print("Done")
    } catch {
        print("\(error)")
    }
}

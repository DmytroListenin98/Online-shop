//
//  ContentView.swift
//  Online Shop
//
//  Created by Dmytro Listenin on 12.04.2026.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreCombineSwift
struct ContentView: View {
    
    //MARK: - Properties
    @FirestoreQuery(collectionPath: "Shop") var items: [Product]
    var columns = Array(repeating: GridItem(), count: 2)
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(items) { item in
                        ProductCartView(product: item)
                    }
                }
            }
            .padding(.horizontal, 10)
            .shadow(color: .black.opacity(0.4), radius: 8, x: 5, y: 8)
            
            //MARK: - Tool Bar
            .navigationTitle("Products")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: FavoriteView()) {
                        Image(systemName: "heart.fill")
                            .font(.title2)
                    }
                    .buttonStyle(.plain)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: CartView()) {
                        Image(systemName: "cart.fill")
                            .font(.title2)
                    }
                    .buttonStyle(.plain)
                }
            }
        }

    }
}


#Preview {
    ContentView()
}
